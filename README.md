# EIE1-FPGA-lab-2016

###Martin Ferianc and George Punter
-------------------------------
This is docummentation to the FPGA Lab in the Spring Term 2016 at Imperial College London, Department of Electronic and Electrical Engineering year 1

The goals of this lab were to:

Further develop experience with EDA tools (such as Quartus), and understand the different processes it applies and the types of analysis it performs.

Put a few more of the concepts from digital logic into practise, in particular with the relationship between sequential logic and combinational logic.

Be able to independently solve problems with toolchains, and use documentation for tools.

Work with digital logic in a real FPGA, as well as simulations of that digital logic.

Deal with and resolve uncertainty in specifications.

The experiments consisted out of: 
 - _Glue Logic_: One of the uses of an FPGA is as glue logic, where it effectively acts as a convenient way of connecting together lights. The DE0 contains 10 lights and 10 switches, so "glue" the switches to the lights - when you toggle each switch the corresponding LED should turn off and on.
  
 - _Blinkenlights_: You will now add a clock input, give the circuit some state, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round). This circuit does not need any inputs, it only has state and outputs.
  
-  _Pipelined multiplier_: Multiplication is a form of repeated addition, and while there are some multiplier blocks built into the FPGA, it is useful to know how they are constructed. The notion of pipelining is also an important concept for your project - how can we (and why do we) split one operation across multiple consecutive cycles?
  
-  _Stopwatch_: The DE0 contains a 4-digit 7-segment output display, with each segment driven by one output pin.
