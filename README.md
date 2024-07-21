# SPI-Interface-with-single-port-RAM

SPI (Serial-Peripheral Interface) is one of the most popular interfaces nowadays.

## Contents

- [Main Function](#main_function)
- [Desgin Flow](#desgin_flow)

## Main Function
<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Figure1.png" alt=" SPI Diagram">
</div>

SPI's main function is to convert serial input to parallel output and vice versa where data can be sent serially from spi-master to spi-slave through the MOSI port or from spi-slave to spi-master through the MISO port, then the slave starts to push these data to a single port ram to be able to write/read addresses or write/read data by the previously given write/read address to indicate the memory location whether I want to write or read from it.

There is an interface responsible for combining both the SPI Slave and the Single Port RAM to facilitate the communication between them and called SPI Wrapper
