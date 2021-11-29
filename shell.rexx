#!/usr/bin/env rexx

do while (1)
  call charout, "> "
  pull cmd
  interpret cmd
end

