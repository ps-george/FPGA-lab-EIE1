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
  of a stopwatch. Here the split time always reflects the time
  between when the "start" and "split" button are presses,
  not the time between consecutive presses of "split". _Note: my conception of split is a little
  different than the standard one; thanks to @bingthegreat93 for
  [highlighting the ambiguity](https://github.com/m8pple/eie1_fpga_lab/issues/2)._

- While the precision of the stopwatch is 10ms, the
  [accuracy](http://en.wikipedia.org/wiki/Accuracy_and_precision)
  of the stopwatch will be less than 10ms, as we don't
  know how accurate the 50MHz clock is. Your stopwatch
  should introduce no more than 1% error on top of
  the clock error.
