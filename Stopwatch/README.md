##Stopwatch

###Task

The DE0 contains a 4-digit 7-segment output display,
with each segment driven by one output pin. Create
a project and top-level called "stopwatch" that has
the following functionality:

- Push-button BUTTON0 resets the stopwatch,
  resetting the 7-segment display to "00.00".

- Push-button BUTTON1 starts the stopwatch,
  showing elapsed time in decimal, with two
  fractional digits, i.e. a precision of 10 ms.

- Push-button BUTTON2 pauses the display for as
  long as it is pushed (held down), but does not stop
  the stopwatch counter, providing something similar to the
  [split](http://en.wikipedia.org/wiki/Stopwatch) functionality
  of a stopwatch. Here the split button pauses the display at a certain time, and then when it is released the time that has been counted to in the background is dislayed.

### Approach

We have divided our solution according to the suggested parts:
  1. A block which generates a tick signal within 1% of the desired frequency.
  2. A block which decodes four 4-bit binary digits to the correct 7-segment display signals.
  3. A block which is able to count to 9999 in [binary-coded-decimal](http://en.wikipedia.org/wiki/Binary-coded_decimal).
  4. A block to handle the push-button functionality and state machine.

#### 1. A block which generates a tick signal within 1% of the desired frequency.
  - For this, we created a block which splits the clock signal into 4 new clock signals. First, we divided the original clock frequency of 50MHz, which would count in 0.00000002s, into 100Hz, which would count in 0.01s. We did this by creating a Counter that would count to 500,000, incrementing every clock cycle. When it reached 500,000, it outputs a pulse to indicate that 0.01s has passed, then started again. This method allowed a quick and easy clock division to an exact value, within 1% of the target frequency, which would have been difficult to implement usig D-flipflops. Then, we divided our 100Hz signal into 10Hz, and 10Hz to 1Hz and 1Hz to 0.1 Hz, outputting each clock frequency from the block for use in our independent counters.
![alt-text](https://github.com/fexter-svk/EIE1-FPGA-lab-2016/blob/master/Resources/FPGA%20lab%20screenshots/stopwatch/clock_splitter.PNG)
  - We discovered that this method of having independent clock signals and counters avoided any major glitches that was previously occuring from connecting our counters in series.

#### 2. A block which decodes four 4-bit binary digits to the correct 7-segment display signals.
```Verilog
assign display[0] = ~decimal[3] & (~decimal[2] | ~decimal[0]) & (decimal[2] 
| decimal[O]) & ~decimal[1];

assign display[1] = decimal[2] & (~decimal[0] |  ~decimal[1]) & (decimal[0] | decimal[1]);

assign display[2] = ~decimal[2] & decimal[1] & ~decimal[0];

assign display[3] = ~decimal[3] & (~decimal[2] | decimal[1] | ~decimal[0])
& (decimal[2] | ~decimal[1]) & (decimal[2]| decimal[0]) & (~decimal[1] | decimal[0]);

assign display[4] = (decimal[2] | decimal[0]) & (~decimal[1] | decimal[0])

assign display[5] = ~decimal[3] & (~decimal[2] | decimal[1]) & 
(~decimal[2] | decimal[0]) & (decimal[1] | decimal[0]);

assign display[6] = ~decimal[3] & (~decimal[2] | decimal[1]) & 
(~decimal[2] | decimal[0]) & (decimal[2] | ~decimal[1]);
```
  - This code then parses the input into correct visible output according to the numbers in decimal. We have developed it with a Karnaugh map and double-checked with the web and the standard form. 
![alt text](http://www.thelearningpit.com/lp/doc/7seg/7truth.gif) 

#### 3. A block which is able to count to 9999.
  - We have decided to split the problem into 4 parts (for each 7-segment display - total of 4 inputs and 4 outputs). Therefore we have made 4 different counters, which count from 0 to 10. Each counter receives a separate clock signal from the pulse generators developed in the first point. Our findings are that it is easier to manipulate with the smaller blocks and individual pulses rather than carrying a pulse from one part to another as this can cause glitches. 
   ![alt text](http://i65.tinypic.com/11lhg08.png)

   __4 counters (from 0 to 10)__

#### 4. A block to handle the push-button functionality and state machine.
   ![alt text](http://s9.postimg.org/5n6bhl2mn/Screen_Shot_2016_03_18_at_9_23_21.png)
   ![alt text](http://i67.tinypic.com/24lrhwj.png)
### Final execution
![alt text](http://i68.tinypic.com/sl4qq8.png)
[![Stopwatch demonstration](http://i68.tinypic.com/1pi7g0.png)](https://youtu.be/1N2TEmU0eFQ "Stopwatch demonstration")

