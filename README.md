# EIE1-FPGA-lab-2016

## Description
This is docummentation for the FPGA Lab in the Spring Term 2016 at Imperial College London, Department of Electronic and Electrical Engineering Year 1

The goals of this lab were to:

1. Further develop experience with EDA tools (such as Quartus), and understand the different processes it applies and the types of analysis it performs.

2. Put a few more of the concepts from digital logic into practice, in particular the relationship between sequential logic and combinational logic.

3. Be able to independently solve problems with toolchains, using the documentation for these tools.

4. Work with digital logic in a real FPGA, as well as creating simulations of that digital logic.

5. Deal with and resolve uncertainty in specifications.

The experiments consisted of: 
 - [Glue Logic](/Glue_logic): One of the uses of an FPGA is as glue logic, where it effectively acts as a convenient way of connecting together lights. The DE0 contains 10 lights and 10 switches, so "glue" the switches to the lights - when you toggle each switch the corresponding LED should turn off and on.
  
 - [Blinkenlights](/Blinkenlights): You will now add a clock input, give the circuit some state, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round). This circuit does not need any inputs, it only has state and outputs.
  
-  [Pipelined multiplier](/Multiplication): Multiplication is a form of repeated addition, and while there are some multiplier blocks built into the FPGA, it is useful to know how they are constructed. The notion of pipelining is also an important concept for your project - how can we (and why do we) split one operation across multiple consecutive cycles?
  
-  [Stopwatch](/Stopwatch): The DE0 contains a 4-digit 7-segment output display, with each segment driven by one output pin. For this experiment we will be creating a stopwatch which will count to 99, displaying seconds and milliseconds on the 7-segment output display. It will be controlled by three buttons; Start, Reset, and Split.

## Authors
Martin Ferianc and George Punter. 2016.
