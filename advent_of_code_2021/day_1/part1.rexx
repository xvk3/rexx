#!/usr/bin/env rexx

input = "input.txt"

lines = 0
increases = 0

do while lines(input) > 0
  current_line = linein(input)
  if (lines > 0) then do
    if (current_line > previous_line) then do
      increases = increases + 1
    end
  end
  lines = lines + 1
  previous_line = current_line
end
say increases 
