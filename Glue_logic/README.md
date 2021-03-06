# Glue Logic

### Task

One of the uses of an FPGA is as [glue logic](http://en.wikipedia.org/wiki/Glue_logic),
where it effectively acts as a convenient way of connecting
together lights. The DE0 contains 10 lights and 10 switches,
so "glues" the switches to the lights - when you toggle each
switch the corresponding LED should turn off or on.

### Approach

The simpliest parity checker is an __ANDgate__, therefore we have decided that we are going to check if the switch is in the position 1 (the signal is HIGH) with an 2-input AND gate. One incomming signal is permanently 1 and the second varies according to the position of the switch. 

| Input       | VCC         | Input & VCC  |
| ------------- |:-------------:| -----:|
| HIGH     | HIGH   |      HIGH  |
| LOW     | HIGH     |   LOW |
_Truth Table_

The connection to the LEDs is very simple, we have just hard-wired the inputs (switches) and outputs (LEDs) according to the the tables. 

![switches](http://i68.tinypic.com/frxgo.png)
_Figure 1: Switches_

![LED pins](http://i65.tinypic.com/xngqbc.png)
_Figure 2:LED pins_

### Circuit

![final circuit diagram](http://i66.tinypic.com/118izib.png)

### Improvements

We could have searched for a 10-bit input AND gate or construct our own symbol to make the circuit "clear". We have found that the input for the HIGH signal or VCC has to be an actual input otherwise the circuit does not work.

