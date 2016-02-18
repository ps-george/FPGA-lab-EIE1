#Glue Logic

###Task

One of the uses of an FPGA is as [glue logic](http://en.wikipedia.org/wiki/Glue_logic),
where it effectively acts as a convenient way of connecting
together lights. The DE0 contains 10 lights and 10 switches,
so "glue" the switches to the lights - when you toggle each
switch the corresponding LED should turn off and on.

###Approach

The simpliest parity checker is an __ANDgate__, therefore we have decided that we are going to check if the switch is in the position 1 (the signal is HIGH) with an 2-input AND gate. One incomming signal is permanently 1 and the second varies according to the position of the switch. 

| Input       | VCC         | Input & VCC  |
| ------------- |:-------------:| -----:|
| HIGH     | HIGH   |      HIGH  |
| LOW     | HIGH     |   LOW |
_Truth Table_

###Circuit

![alt tag](http://i66.tinypic.com/118izib.png)

