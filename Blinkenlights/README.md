#Blinkenlights

###Task

We will now add a clock input, give the circuit some states, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round). This circuit does not need any external inputs, it only has its state and outputs.

###Approach

1. _Frequency divider:_ To achieve the frequency ~47.6837hz we had to decrease the frequency from the 50MHz supported by the DE0 development board. We did it by combining  __D flip-flops__. Each D flip-flop slows down the signal by a half. The first D flip-flop from 50MHz to 25MHz and so on. By sequentially connecting 20 of them we slow down the signal to the required frequency. After creating our frequency divider, we created a symbol so that when connecting our devicing we just simply feed our clock signal into the symbol.

![alt text](http://www.electronics-tutorials.ws/counter/cou1.gif?81223b)

2. _Binary counter:_ In order to implement a 10-bit binary counter, we combined a sequence of __J-K flip-flops__ with J and K always set to 1. This means when a clock pulse arrives at the flip-flop, its output value is "toggled", and so with a sequence of flip-flops, the least significant bit (LSB), i.e. the output of the first flip-flop is toggled at the highest frequency, and the last flip-flop, the MSB, at the lowest frequency. To get the count in the correct direction, our solution was to connect the input of each following J-K flip-flop to the Q' output of the proceeding flip-flop. With this arrangement, when the previous flip-flop transitions from 1 to 0, this will create a rising edge at Q', toggling the output of the next flip-flop. Chaining this effect with 10 J-K flip-flops and taking the outputs as the Q output from each one creates our 10-bit binary counter. Again, we made a symbol for our 10-bit counter to make connectivity easier.

![alt text](https://www.ibiblio.org/kuphaldt/electricCircuits/Digital/04348.png)


#####Final circuit
To finalise the circuit we simply fed the output of our 10-bit counter into a symbol we created for our glue logic task, and took the output of this symbol to the correct outputs, which correspond to the LEDs. When we compiled and programmed the code to the FPGA, it worked correctly ~~and we high fived~~.
![alt text](http://i63.tinypic.com/ml31fk.png)
