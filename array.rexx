#!/usr/bin/env rexx

arr.  = "Undefined"
arr.0 = "zero"
arr.1 = "one"
arr.2 = "two"
arr.3 = "three"
arr.4 = "four"

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayPush(arr.,"five")"
say ArrayPush(arr.,"five")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayUnshift(arr.,"minus")"
say ArrayUnshift(arr.,"minus")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayPop(arr.)"
say ArrayPop(arr.)
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
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
  do i = 0 to (len - 1) by 1
    str = str""arr.i
    if (i < len - 1) then do
      str = str", "
    end
  end
  return str

/* calulcates the number of elements in an array */
/* returns the array length */
ArrayLength:
  parse arg arr
  i = 0
  /* increment i until arr.i == "Undefined" */
  do until (compare(arr.i, "Undefined") == 0)
    i = i + 1
  end
  return i

/* remove an element from the end of an array */
/* returns the removed element */
ArrayPop:
  parse arg arr
  len = ArrayLength(arr.) - 1
  element = arr.len
  arr.len = "Undefined"
  return element

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg arr,element
  len = ArrayLength(arr.)
  arr.len = element
  return len + 1

/* remove an element from the beginning of an array */
/* returns the removed element */
ArrayShift:
  parse arg arr
  len = ArrayLength(arr.)
  element = arr.0
  do i = 0 to (len - 1) by 1
    j = i + 1
    arr.i = arr.j
  end
  return element

/* add an element to the beginning of an array */
/* reutns the new array length */
ArrayUnshift:
  parse arg arr,element
  len = ArrayLength(arr.)
  do i = len to 1 by -1
    j = i - 1
    arr.i = arr.j
  end
  arr.0 = element
  return len + 1

