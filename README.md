# CPRE381-Lab-6-Sequential-Multiplier
In this lab I created a sequential multiplier circuit in VHDL. I made several individual components like generic size adders and registers and combined them to form the system. I made a diagram of the system that is in this repository for clarification on how it works. I didn't make a test bench for this file, so to run it you must load it into a hardware simulator like ModelSIM and test the inputs to make sure they work. To run it, set the write enable signal to 1 to load in two values to the multiplicand and multiplier registers. After the values are loaded into these registers set write enable back to zero and wait for a couple clock cycles for the computation to be performed.
