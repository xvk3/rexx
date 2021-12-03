#!/usr/bin/env rexx

input = "input.txt"

depth = 0
horiz = 0

do while lines(input) > 0
  line = linein(input)
  say line
  parse value line with command magnitude
  if (compare(command,"forward") == 0) then do
    horiz = horiz + magnitude
  end
  if (compare(command,"up") == 0) then do
   depth = depth - magnitude
  end
  if (compare(command,"down") == 0) then do
   depth = depth + magnitude
  end
  say "h="horiz "d="depth
end
say depth*horiz
