#!/usr/bin/env rexx

say "What are the prime factors of 819?"
say PrimeFactor(819)

PrimeFactor:
  parse ARG n
  say n
  /* bad artithmetic conversion on the line below */
  say n+1
return n
