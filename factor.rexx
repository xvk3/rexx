#!/usr/bin/env rexx

test. = "Undefined"
test  = "test"
element = 23
call ArrayPush2 test.,element
say test.0 /* Undefined */
say arr.0  /* 23 ... */
say ArrayPush2(test.,element)
say test.0
say arr.0

exit
say "What are the prime factors of 819?"
say PrimeFactor(819)

exit

PrimeFactor:
  parse ARG n
  factors. = "Undefined"
  do m = 2 by 1 while (n > m)
    say "is "n" / "m" == 0?"
    if (n // m == 0) then do
      say "dividing "n" by "m
      say ArrayPush(factors.,m)
      /* says "factors.0 = ARR.0" */
      say "factors.0 = "factors.0
      n = n / m
      say "n now = "n
    end
    pull x
  end
  say n
return n

/* pretty print of an array */
ArrayPrint:
  parse arg arr
  i = 0
  do until (compare(arr.i, "Undefined") == 0)
    if (i == 0) then do
      str = arr.i
    end
    else do
      str = str", "arr.i
    end
    i = i + 1
  end
  return str

/* calulcates the number of elements in an array */
/* returns the array length */
ArrayLength:
  parse arg arr
  i = 0
  do until (compare(arr.i, "Undefined") == 0)
    i = i + 1
  end
  return i

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg arr,element
  i = 0
  say "ArrayPush:arr.0 = "arr.i
  if (compare(arr.0, upper("arr.0")) > 0) then do
    do until (compare(arr.i, "Undefined") == 0)
      i = i + 1
    end
  end
  say "setting arr."i" to "element
  arr.i = element
  return i + 1

ArrayPush2:
  parse arg arr,element
  say arr
  arr.0 = element
  say element
  return 1







