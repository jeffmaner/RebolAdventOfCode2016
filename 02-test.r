Rebol [
  Title: "Rebol Advent of Code 2016 Day 2 Tests"
  Usage: { "do %02-test.r" }
]

do load %02.r
do load %ancillary.r

test1: func [
  /local test-title instructions result
] [
  test-title: "Test 1"

  instructions: [
    ULL
    RRDDD
    LURDL
    UUUUD
  ]

  result: do-instructions instructions

  report test-title [ 1 9 8 5 ] result
]

test1

test2: func [
  /local test-title instructions result
] [
  test-title: "Test 2"

  instructions: [
    ULL
    RRDDD
    LURDL
    UUUUD
  ]

  result: do-instructions-actual instructions

  report test-title [ #"5" #"D" #"B" #"3" ] result
]

test2
