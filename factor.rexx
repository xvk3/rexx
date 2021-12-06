#!/usr/bin/env rexx

/* one solution to the problem with being unable to access an array in a function is to always use "arr" in
functions and simply prefix the "call Array*" with "arr. = input." */
/* regina-rexx is classic rexx and doesn't support "arr. = input." */
/* ooRexx does support it */

list.1 = 0
list.2 = 0 
list.3 = 0 

/* Assigning new values to the array*/ 
list.1 = 10 
list.3 = 30 
listnew. = list. 

say listnew.1 
say listnew.2 
say listnew.3 

/* procedure tests */
a = 5
say a
call Proc a
say a
call NonProc a
say a
call ProcA a
say a

call Skip /* ew */

Proc: procedure
  parse arg q
  q = 10
  a = q
  return

NonProc:
  parse arg q
  q = 20
  a = q
  return

ProcA: procedure expose a
  parse arg q
  q = 30
  return

Skip:

/* problem is: there are no arrays in rexx it's just defining variables */
/* passing an array to a function doesn't pass a pointer to it - it passes the value of the parameter */
/* it also seems that I can't copy arrays in an interpret command "interpret arr.' = name.'" */
/* is "parse arg x" the same as "arg x" ??? */
  /* no "arg" = "parse upper arg" */
  /* I should be using "parse caseless arg" */

test. = "Undefined"
name = "test"
e = "new value"


say "test.0 before ArrayPush = "test.0
say "call ArrayPush "name","e
call ArrayPush name,e
say "test.0 after  ArrayPush = "test.0
say "call ArrayPush "name",hello two"
call ArrayPush name,"hello two"
say "test.0 after  ArrayPush = "test.0
say "test.1 after  ArrayPush = "test.1

/* can't seem to get ArrayPush to even read *.0 correctly after a previous call */

exit

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg n,e
  /* handle empty array */
  interpret zeroth" = "n".0"
  /* say zeroth <- this shouldn't be Undefined the second time round */
  if (compare(zeroth, "Undefined") == 0) then do
    interpret n".0 = "e
  end
  else do
    /* attempt to create local copy of array using n (array name) */
    tmp. = "Undefined"
    i = 0
    interpret tmp.i" = "n".0"
    say tmp.i
    do until (compare(tmp.i, "Undefined") == 0)
      interpret tmp.i" = "n"."i
      say "just did tmp."i" = "n"."i
      i = i + 1
    end
    tmp.i = e  
    say "just did tmp."i" = "e
    say "tmp."i" = "tmp.i
    interpret n"."i" = "e
    say "test"
    say n".1"
    interpret n". = "tmp.
  end
  return
  

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


