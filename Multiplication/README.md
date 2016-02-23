#Multiplication

###Task

Multiplication is a form of repeated addition, and while there are some multiplier blocks built into the FPGA, it is useful to know how they are constructed. The notion of pipelining is also an important concept for your project - how can we (and why do we) split one operation across multiple consecutive cycles?

#####Combinational multiplication circuit

The approach that has to be considered for this exercise should be purely combinatorial. Therefore we decided to apply the standard approach from decimal/binary multiplication:

![alt tag](http://www.electronicshub.org/wp-content/uploads/2015/06/Binary-Multiplication.jpg)
_4 bit multiplication_

Each partial result represents one row of one multiplicant multiplied with a bit from the second multiplicant from LSB to MSB. As we move to the MSB the result has to be shifted by one place each time to the left as in the decimal representation. Then the partial results just have to be summed together as in this representative diagram for 4-bit multiplication. FA represents a full adder and the multiplication itself is dobe by simple ANDing each individual numbers together. 

![alt tag](http://computationstructures.org/notes/images/mul4-combinational.png)
_4 bit multiplication_

