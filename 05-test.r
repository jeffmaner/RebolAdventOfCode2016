Rebol [
  Title: "Rebol Advent of Code 2016 Day 5 Tests"
  Usage: { "do %05-test.r" }
  Remarks: { Takes a while to run. }
]

do load %05.r
do load %ancillary.r

test-abc-yields-18f47a30: func [
  /local test-title result
] [
  test-title: "abc yields 18f47a30"

  result: calculate-password "abc"

  report test-title "18f47a30" result
]

test-abc-yields-18f47a30

test-abc-yields-05ace8e3: func [
  /local test-title result
] [
  test-title: "abc yields 05ace8e3"

  result: calculate-password' "abc"

  report test-title "05ace8e3" result
]

test-abc-yields-05ace8e3
