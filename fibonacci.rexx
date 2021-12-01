#!/usr/bin/env rexx

say "What is the 41st element of the Fibonacci sequence?"
say FibN(41)

say "What index is the element 6765?"
say FibI(6765) 

/* returns nth element of the Fibonacci sequence */
FibN:
  parse ARG n
  m = 0
  p = 1
  do while (n > 0)
    t = m
    m = m + p
    p = t
    n = n - 1
  end
return m

/* returns the index of a given element */
FibI:
  parse ARG e
  n = 0
  m = 0
  p = 1
  do while (m < e)
    t = m
    m = m + p
    p = t
    n = n + 1
  end
return n
