Rebol [
  Title: "Rebol Advent of Code 2016 Day 3 Tests"
  Usage: { "do %03-test.r" }
]

do load %03.r
do load %ancillary.r

test1: func [
  /local test-title sides result
] [
  test-title: "Test 1"

  sides: [ 5 10 25 ]

  result: can-be-triangle sides

  report test-title false result
]

test1

test2: func [
  /local test-title dimensions dimensions' result result'
] [
  test-title: "Test 2"

  dimensions: [
    101 301 501
    102 302 502
    103 303 503
    201 401 601
    202 402 602
    203 403 603 ]

  dimensions': regroup dimensions

  result: copy []
  forskip dimensions' 3 [
    append result can-be-triangle reduce [ first dimensions' second dimensions' third dimensions' ]
  ]

  result': copy []
  foreach r result [
    if r [
      append result' r
    ]
  ]

  report test-title 6 length? result'
]

test2
