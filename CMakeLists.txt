CMAKE_MINIMUM_REQUIRED(VERSION 3.5)
set(CMAKE_CXX_STANDARD 14)

# compile the libraries
add_subdirectory(modules/DES)
add_subdirectory(modules/UDP-Server)

# compile the key distribution center program
include_directories(modules/DES)
include_directories(modules/UDP-Server)
add_executable(kdc
    key_distribution_center.cc
)

target_link_libraries(kdc
    des
    udp
)



# build user 1 (Alice)
add_executable(thor
    thor.cc
)

target_link_libraries(thor
    des
    udp
)

# build user 2 (Bob)
add_executable(iron_man
    iron_man.cc
)

target_link_libraries(iron_man
    des
    udp
)
