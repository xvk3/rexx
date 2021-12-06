#!/usr/bin/env rexx

/* problem is: there are no arrays in rexx it's just defining variables */
/* passing an array to a function doesn't pass a pointer to it - it passes the value of the parameter */
/* it also seems that I can't copy arrays in an interpret command "interpret arr.' = name.'" */

test. = "Undefined"
name = "test"
e = "new value"

test.0 = "hello"

say "test.0 before ArrayPush = "test.0
say "test.1 before ArrayPush = "test.1
call ArrayPush name,e
say "test.0 after  ArrayPush = "test.0
say "test.1 after  ArrayPush = "test.1

exit

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg n,e
  /* handle empty array */
  interpret zero" = "n".0"
  if (compare(zero, "Undefined") == 0) then do
    interpret n".0 = "e
    return 1
  end
  /* attempt to create local copy of array using n (array name) */
  tmp. = "Undefined"
  i = 0
  /*interpret tmp.i" = "n".0"*/
  do until (compare(tmp.i, "Undefined") == 0)
    interpret tmp.i" = "n".i"
    say "just did tmp."i" = "n"."i
    i = i + 1
  end
  tmp.i = e  
  say "just did tmp."i" = "e
  say "tmp."i" = "tmp.i
  interpret n"."i" = "e
  interpret t" = "n".1"
  say t
  say n".1"
  /*interpret n". = "tmp.*/
  return i

element = 23
interpret name".0 = 'hi'"
say test.0
say name.0
call ArrayPush2 test.,element
say test.0 /* Undefined */
say arr.0  /* 23 ... */
call ArrayPush2 test.,element
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


