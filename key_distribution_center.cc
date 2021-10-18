#include <chrono>
#include <cmath>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>

#include "des_cipher.h"
#include "udp_server.h"

long long private_key = 9;


// ----------------------------------------------------------------------------
inline void validate_input(int argc, char** argv) {
  if (argc != 3) {
    std::cerr << "Invalid Argument(s).\n";
    std::cerr << "USAGE: " << argv[0] << " <keys-file>\n";
    std::exit(EXIT_FAILURE);
  } 
}

// ----------------------------------------------------------------------------
void read_public_info(char** argv, long long* P_alice, long long* G_alice, 
                      long long* P_bob, long long* G_bob) {
  // read Alice and Bob's keys
  std::ifstream in(argv[1]);
  if (!in.good()) {
    std::cerr << "ERROR: failed to open key file\n";
    std::exit(EXIT_FAILURE);
  }
  in >> *P_alice >> *G_alice;
  std::cout << "Thor's public info: \n"
            << "P: " << *P_alice << "\n"
            << "G: " << *G_alice << std::endl;

  in.close();
  in.open(argv[2]);
  if (!in.good()) {
    std::cerr << "ERROR: failed to open key file\n";
    std::exit(EXIT_FAILURE);
  }  

  in >> *P_bob >> *G_bob;
  std::cout << "\nIron Man's public info: \n"
            << "P: " << *P_bob << "\n"
            << "G: " << *G_bob << std::endl;
}

// ----------------------------------------------------------------------------
uint16_t diffie_hellman(UDP::Server& server, int port, long long P, long long G) {
  // wait to receive a message from user
  std::string buffer;
  server.receive(buffer);
  long long received_key = (long long)stoi(buffer);

  // send generated key to user
  long long generated_key = (long long)pow(G, private_key) % P;
  server.send("127.0.0.1", port, std::to_string(generated_key));

  // compute session key
  long long session_key = (long long)pow(received_key, private_key) % P;

  // strip off all but last ten bits
  session_key &= 0x3FF;
  session_key ^= 0x3FF;

  return static_cast<uint16_t>(session_key);
}


// ----------------------------------------------------------------------------
uint16_t secure_connection(UDP::Server& server, std::string& name, 
                            int client_port, long long P, long long G) {
  std::cout << "\nWaiting to receive a connection request from " << name << "\n";
  uint16_t session_key = diffie_hellman(server, client_port, P, G);
  std::cout << "KDC: The session key with " << name
            << " is " << session_key << std::endl;

  return session_key;
}


// ----------------------------------------------------------------------------
uint16_t prompt_user_and_receive_key(UDP::Server& server, DES::Cipher& cipher, 
                                      std::string& msg, int client_port, 
                                      std::string& name) {

  std::string encrypted;
  cipher.encrypt(msg, encrypted);
  // for (char c : msg)
  //   encrypted += cipher.encrypt(c);
  server.send("127.0.0.1", client_port, encrypted);

  // receive user's (encrypted) private key
  std::string buffer;
  server.receive(buffer);
  std::string decrypted;
  cipher.decrypt(buffer, decrypted);
  // for (char c : buffer)
  //   decrypted += cipher.decrypt(c);

  std::cout << "Received private key from " << name << std::endl;
  uint16_t private_key = std::stoi(decrypted, nullptr, 16);
  return private_key;
}

// ----------------------------------------------------------------------------
void initialize_needham_schroeder(UDP::Server& server, uint16_t client_session_key, 
                                  uint16_t private_key_alice, int port_alice,
                                  uint16_t private_key_bob) {

  std::string key_string = std::to_string(client_session_key);
  
  // send the session key to Alice, encrypted with her private key
  DES::Cipher cipher_alice(private_key_alice);
  std::string encrypted;
  cipher_alice.encrypt(key_string, encrypted);

  server.send("127.0.0.1", port_alice, encrypted);

  // send another session key to Alice, encrypted with Bob's private key
  DES::Cipher cipher_bob(private_key_bob);
  cipher_bob.encrypt(key_string, encrypted);

  // send Bob's key and a timestamp
  using namespace std::chrono;
  milliseconds ms = duration_cast< milliseconds >(system_clock::now().time_since_epoch());
  unsigned long long timestamp = ms.count();
  std::string str_timestamp;
  cipher_bob.encrypt(std::to_string(timestamp), str_timestamp);

  std::cout << "Timestamp: " << timestamp << std::endl;
  server.send("127.0.0.1", port_alice, encrypted);
  server.send("127.0.0.1", port_alice, str_timestamp);
}



// ============================================================================
int main(int argc, char** argv) {
  validate_input(argc, argv);

  // read alice and bob's public info
  long long P_alice, G_alice, P_bob, G_bob;
  read_public_info(argv, &P_alice, &G_alice, &P_bob, &G_bob);

  // start server
  int port = 5000;
  int port_alice = 5001;
  int port_bob = 5002;
  std::string host = "127.0.0.1";
  UDP::Server server(host, port);

  // establish a secure connection with Alice
  std::string name = "Thor";
  uint16_t session_key_alice = secure_connection(server, name, port_alice,
                                                  P_alice, G_alice);
  
  // prompt Alice to send the key for her communication with Bob
  DES::Cipher cipher_alice(session_key_alice);
  std::string msg = "Hello Thor,provide secret key you wish to pair with Iron Man"
                    " to start communication with him (3-digit hex):";
  uint16_t private_key_alice = prompt_user_and_receive_key(server, cipher_alice,
                                                            msg, port_alice, name);

  // establish a secure connection with Bob
  name = "Iron Man";
  uint16_t session_key_bob = secure_connection(server, name, port_bob, P_bob, G_bob);

  // Prompt Bob to send a private key to talk to Alice
  DES::Cipher cipher_bob(session_key_bob);
  msg = "Hello Iron Man, Thor wants to communicate. Please input the secret key"
        " you wish to use (3-digit hex):";
  uint16_t private_key_bob = prompt_user_and_receive_key(server, cipher_bob, 
                                                          msg, port_bob, name);

  // --------- DIFFIE-HELLMAN COMPLETE; BEGIN NEEDHAM SCHROEDER --------- //
  std::cout << "\nInitializing the Needham-Schroeder Protocol\n";

  // generate a "random" session key for alice and bob
  uint16_t client_session_key = session_key_bob ^ session_key_alice;
  std::cout << "Session key for Thor and Iron Man: " << client_session_key << "\n";

  // once the server initializes the Needham-Schroeder Protocol, it is no longer needed
  initialize_needham_schroeder(server, client_session_key, private_key_alice, 
                                port_alice, private_key_bob);
  std::cout << "Thor and Iron Man can now securely communicate. Shutting down.\n";

  return EXIT_SUCCESS;
}
