#!/usr/bin/env rexx

arr.  = "Undefined"
arr.0 = "one"
arr.1 = "two"
arr.2 = "three"
arr.3 = "four"

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayPush(arr.,'five')"
say ArrayPush(arr.,"five")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayUnshift(arr.,'zero')"
say ArrayUnshift(arr.,"zero")
say "ArrayPrint(arr.)"
say ArrayPrint(arr.)
say ""

say "ArrayLength(arr.)"
say ArrayLength(arr.)
say "ArrayUnshift2(arr.,'minus')"
say ArrayUnshift2(arr.,"minus")
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
  i = 0
  do until(compare(arr.i, "Undefined") == 0)
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

/* remove an element from the end of an array */
/* returns the removed element */
ArrayPop:
  parse arg arr
  i = 0
  do until (compare(arr.i, "Undefined") == 0)
    i = i + 1
  end
  i = i - 1
  element = arr.i
  arr.i = "Undefined"
  return element

/* add an element to the end of an array */
/* returns new array length */
ArrayPush:
  parse arg arr,element
  i = 0
  do until (compare(arr.i, "Undefined") == 0)
    i = i + 1
  end
  arr.i = element
  return i + 1

/* remove an element from the beginning of an array */
/* returns the removed element */
ArrayShift:
  parse arg arr
  element = arr.0
  i = 0
  do until (compare(arr.i, "Undefined") == 0)
    j = i + 1
    arr.i = arr.j
    i = j
  end
  return element

/* add an element to the beginning of an array */
/* returns the new array length */
ArrayUnshift:
  parse arg arr,element
  len = ArrayLength(arr.)
  do i = len to 1 by -1
    j = i - 1
    arr.i = arr.j
  end
  arr.0 = element
  return len + 1

ArrayUnshift2:
  parse arg arr,element
  /* add element */
  hold = arr.0
  arr.0 = element
  /* shift elements */  
  i = 1
  do until (compare(hold, "Undefined") == 0) 
    tmp = arr.i
    arr.i = hold
    hold = tmp
    i = i + 1
  end
  return i
