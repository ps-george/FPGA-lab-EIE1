#Blinkenlights

###Task

We will now add a clock input, give the circuit some state, and get the LEDs to display a 10-bit binary counter, incrementing at a rate of ~47.6837hz (i.e. it should take ~21.5 seconds for the LED counter to wrap round). This circuit does not need any inputs, it only has state and outputs.

###Approach

1. To achieve the frequency ~47.6837hz we had to decrease the frequency from the 50MHz supported by the DE0 development board. We did it by comgining a  __D-flipflop__. Each D-flipflop slows down the signal by a half. The first D-flipflop from 50MHz to 25MHz and so on. By sequentially connecting 20 of them we slow down the signal to the required frequency. 

![alt text](http://www.electronics-tutorials.ws/counter/cou2.gif?81223b)
