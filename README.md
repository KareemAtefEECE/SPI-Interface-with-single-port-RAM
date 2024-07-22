# SPI-Interface-with-single-port-RAM

SPI (Serial-Peripheral Interface) is one of the most popular interfaces nowadays.

## Contents

- [Main Function](#main_function)
- [Design Flow](#design_flow)

## Main Function
<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Figure1.png" alt=" SPI Diagram">
</div>
<br>


SPI's main function is to convert serial input to parallel output and vice versa where data can be sent serially from spi-master to spi-slave through the MOSI port or from spi-slave to spi-master through the MISO port, then the slave starts to push these data to a single port ram to be able to write/read addresses or write/read data by the previously given write/read address to indicate the memory location whether I want to write or read from it.

There is an interface responsible for combining both the SPI Slave and the Single Port RAM to facilitate the communication between them and called SPI Wrapper

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Figure2.png" alt=" SPI Wrapper Diagram">
</div>


## Design Flow

1) RTL Design Code which is represented in :
   a) SPI_Slave.v
   b) Ram.v
   c) SPI_Wrapper.v

2) HDL RTL Simulation which represented in testing the 4 main operations of the SPI Interface through SPI_Wrapper_tb:<br><br>
  a) Write Address

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Write Address.png" alt=" Write Address">
</div>

<br>

  b) Write Data

  <div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Write Data.png" alt=" Write Data">
</div>

<br>
  
  c) Read Address

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Read Address.png" alt=" Read Address">
</div>

<br>
  
  d) Read Data

  <div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Read Data.png" alt=" Read Data">
</div>

<br>
<br>


3) Synthesized Design<br>

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Synthesized Design.png" alt=" Synthesized Design">
</div>

<br>

Report Utilization Summary<br>

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Report Utilization Summary.png" alt=" Report Utilization Summary">
</div>

<br>

4) Implemented Design<br>

<div align="center">
  <img src="https://github.com/KareemAtefEECE/SPI-Interface-with-single-port-RAM/blob/main/images/Implemented Design.png" alt=" Implemented Design">
</div>

<br>


