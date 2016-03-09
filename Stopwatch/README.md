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
  not the time between consecutive presses of "split".

### Approach

We have divided our solution according to the suggested parts:
1. A block which generates a tick signal within 1% of the desired frequency.
2. A block which decodes four 4-bit binary digits to the correct 7-segment display signals.
3. A block which is able to count to 9999 in [binary-coded-decimal](http://en.wikipedia.org/wiki/Binary-coded_decimal).
4. A block to handle the push-button functionality and state machine.

