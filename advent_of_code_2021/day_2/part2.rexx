#!/usr/bin/env rexx

NUMERIC DIGITS 10

input = "input.txt"

depth = 0
horiz = 0
aim = 0

do while lines(input) > 0
  line = linein(input)
  say line
  parse value line with command magnitude
  if (compare(command,"forward") == 0) then do
    horiz = horiz + magnitude
    depth = depth + (aim * magnitude)
  end
  if (compare(command,"up") == 0) then do
   aim = aim - magnitude
  end
  if (compare(command,"down") == 0) then do
   aim = aim + magnitude
  end
end
say horiz*depth
