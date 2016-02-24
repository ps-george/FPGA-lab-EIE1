#Multiplication

###Task

Multiplication is a form of repeated addition, and while there are some multiplier blocks built into the FPGA, it is useful to know how they are constructed. The notion of pipelining is also an important concept for your project - how can we (and why do we) split one operation across multiple consecutive cycles?

####Combinational multiplication circuit

The approach that has to be considered for this exercise should be purely combinatorial. Therefore we decided to apply the standard approach from decimal/binary multiplication (this was our first thought):

![alt tag](http://www.electronicshub.org/wp-content/uploads/2015/06/Binary-Multiplication.jpg)
_4 bit multiplication_

Each partial result represents one row of one multiplicant multiplied with a bit from the second multiplicant from LSB to MSB. As we move to the MSB the result has to be shifted by one place each time to the left as in the decimal representation. Then the partial results just have to be summed together as in this representative diagram for 4-bit multiplication. FA represents a full adder and the multiplication itself is dobe by simple ANDing each individual numbers together. 

![alt tag](http://computationstructures.org/notes/images/mul4-combinational.png)
_4 bit multiplication_

After understanding this basic many bloc multiplication we have implemented the circuit that is outlined in the docummentation. The outline to this circuit was this algorithm:

```
// a and b are 5-bit numbers
unsigned multiply(unsigned a, unsigned b)
{
  unsigned r=0;
  for(unsigned i=0; i<5; i++){ // Loop over 5 bits of a
    r=r*2; // Shift r left by one bit
    if(a&0x10){ // Test whether a[4] (the MSB) is 1
      r=r+b;
    }
    a=a*2;	// Shift a left by one bit
  }
  return r;
}
```

The combinational solution depended on unrolling the forloop and establishing simple stages:

1. Shift the result register by 2 (basically add to itself = r=r*2)
2. If the MSB of A at given stage (5 stages, A[4] -> A[0]) is one then add number B to the result register
3. Shift the number A to the left by one place. (A[1] = A[0] ... A[4] = A[3])
4. Repeat 5 times
5. Output the result

We have created a bloc for the general stage (covering the points 1 to 4):

![alt tag](http://i67.tinypic.com/2rw6p04.png)
__Stage 0__

Then we have added the 5 stages together to output the result without clock or any registers so the result immediately appeared on the DE0 board.

![alt tag](http://i64.tinypic.com/w7c18w.png)
__All the stages together__

Resulting in the final symbol for the combinational circuit:

![alt tag](http://i67.tinypic.com/2gtz1p2.png)
__The final symbol__

####Input stored in registers as well as output

Our solution enabled us to just add registers before and after the multiplication to store the results. We have assigned 2 buttons as our clocks. The first button serverd to load the input registers with values and the second button served to output the result to the LEDs. Thy symbol then looked like: 

![alt tag](http://i65.tinypic.com/2dszkp.png)
__Multiplication with registers__

####Pipelined multiplier

This approach requires to add registers after completion of each stage (in total 5). They are all driven by the same clock. what we have found out the circuit does not react only on the rising edge but also the falling edge so in total it took us 3 button pushes to perform the multiplication. 

![alt tag](http://i64.tinypic.com/2lm4ac2.png)
__Pipelined multiplier__



