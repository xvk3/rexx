#!/usr/bin/env rexx

input = "input.txt"

lines = 0
increases = 0

do while lines(input) > 0
  /* skip to first 3 value average */
  if (lines == 0) then do
    line.2 = linein(input)
    line.1 = linein(input)
    line.0 = linein(input)
    lines = 2
    current_average = line.0 + line.1 + line.2
  end
  else do
    /* calculate average */
    line.2 = line.1
    line.1 = line.0
    line.0 = linein(input)
    previous_average = current_average
    current_average = line.0 + line.1 + line.2
    /* check for increase */  
    if (current_average > previous_average) then do
      increases = increases + 1
    end
    lines = lines + 1
  end
end
say increases 
