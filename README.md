# Very simple RISC-V processor core that supports RV32I subset.
This is an undergraduate level project completed in March 2022.  
SystemVerilog is used. The design is verified using Quartus II and DE0-Nano FPGA board.  
### The version 1
It is a single-cycle core with simplest design. It can be a good example for education.  
The microarchitecture schematic:  
  
  
![image](schematics/v1.png)  
  
  
The controller truth table:  
  
  
![image](schematics/v1_controller_table.png)  
  
  
### The version 2
The core is extended with a simple in-order superscalar unit. Switching gates for memories are added as well.  
The microarchitecture schematic:  
  
  
![image](schematics/v2.png)  
  
  
The controller truth table:  
  
  
![image](schematics/v2_controller_table.png)  
  
  
### FPGA demo
This repo does not contain project files or setting files for the FPGA project.  
To run the demo, please replace the top level design and instructions (.txt), and add source files to the FPGA project you have created. Quartus or Vivado or any other tools.  
Instructions for the LED counter are loaded.  
If you are using DE0-Nano, please look at the pdf file in the demo folder.  
  
  
<img src="https://github.com/gsmark36/very-simple-riscv-core/blob/072c0681ec0da6fa76c5eae5c82fdd4edab8a9cd/schematics/demo.png" width=50% height=50%>  
  
  
## References
[1] David Harris and Sarah Harris. 2012. Digital Design and Computer Architecture, Second Edition (2nd. ed.). Morgan Kaufmann Publishers Inc., San Francisco, CA, USA.  
[2]	David Patterson and Andrew Waterman. 2017. The RISC-V Reader: An Open Architecture Atlas (1st. ed.). Strawberry Canyon.  
