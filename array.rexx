#!/usr/bin/env rexx

arr. = "Undefined"

arr.0 = "zero"
arr.1 = "one"
arr.2 = "two"
arr.3 = "three"
arr.4 = "four"

say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayPush(arr.,"five")"
say ArrayPush(arr.,"five")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayUnshift(arr.,"minus")"
say ArrayUnshift(arr.,"minus")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayPop(arr.)"
say ArrayPop(arr.)
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayShift(arr.)"
say ArrayShift(arr.)
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

exit

/* pretty print of an array */
ArrayPrint:
  parse arg arr
  len = ArrayLength(arr.)
  str = ""
  do i = 0 to len-1
    if (i == len-1) then do
      str = str""arr.i
    end
    else do
      str = str""arr.i","
    end
  end
  return str

/* return the array length */
ArrayLength:
  parse arg arr
  i = 0
  do while 1
    if (compare(arr.i, "Undefined") == 0) then do
      return i
    end
    i = i + 1
  end

/* remove an element from the end of an array */
/* returns the removed element */
ArrayPop:
  parse arg arr
  len = ArrayLength(arr.)-1
  element = arr.len
  arr.len = "Undefined"
  return element

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg arr,element
  len = ArrayLength(arr.)
  arr.len = element
  return len

/* remove an element from the beginning of an array */
/* returns the removed element */
ArrayShift:
  parse arg arr
  len = ArrayLength(arr.)
  element = arr.0
  do i = 0 to len-1
    j = i + 1
    arr.i = arr.j
  end
  return element

/* add an element to the beginning of an array */
/* reutns the new array length */
ArrayUnshift:
  parse arg arr,element
  len = ArrayLength(arr.)
  i = len + 1
  do while (i > 0)
    j = i - 1
    arr.i = arr.j
    i = i - 1
  end
  arr.0 = element
  return len + 1

