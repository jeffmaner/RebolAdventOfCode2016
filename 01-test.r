Rebol [
  Title: "Rebol Advent of Code 2016 Day 1 Tests"
  Usage: { "do %01-test.r" }
]

do load %01.r
do load %ancillary.r

test-turn-N-L-returns-W: func [
  /local test-title result
] [
  test-title: "Reorient N L Returns W"

  result: turn 'N #"L"

  report test-title 'W result
]

test-turn-N-R-returns-E: func [
  /local test-title result
] [
  test-title: "Reorient N R Returns E"

  result: turn 'N #"R"

  report test-title 'E result
]

test-turn-S-R-returns-W: func [
  /local test-title result
] [
  test-title: "Reorient S R Returns W"

  result: turn 'S #"R"

  report test-title 'W result
]

test-turn-S-L-returns-E: func [
  /local test-title result
] [
  test-title: "Reorient S L Returns E"

  result: turn 'S #"L"

  report test-title 'E result
]

test-turn-E-R-returns-S: func [
  /local test-title result
] [
  test-title: "Reorient E R Returns S"

  result: turn 'E #"R"

  report test-title 'S result
]

test-turn-E-L-returns-N: func [
  /local test-title result
] [
  test-title: "Reorient E L Returns N"

  result: turn 'E #"L"

  report test-title 'N result
]

test-turn-W-L-returns-S: func [
  /local test-title result
] [
  test-title: "Reorient W L Returns S"

  result: turn 'W #"L"

  report test-title 'S result
]

test-turn-W-R-returns-N: func [
  /local test-title result
] [
  test-title: "Reorient W R Returns N"

  result: turn 'W #"R"

  report test-title 'N result
]

test-turn-N-L-returns-W
test-turn-N-R-returns-E
test-turn-S-L-returns-E
test-turn-S-R-returns-W
test-turn-E-L-returns-N
test-turn-E-R-returns-S
test-turn-W-L-returns-S
test-turn-W-R-returns-N

test-walk-0x0-N-2-returns-0x2: func [
  /local test-title result
] [
  test-title: "Walk N 2 from 0x0 Returns  0x2"

  result: walk 0x0 'N 2

  report test-title 0x2 result
]

test-walk-0x0-S-2-returns-0x-2: func [
  /local test-title result
] [
  test-title: "Walk S 2 from 0x0 Returns 0x-2"

  result: walk 0x0 'S 2

  report test-title 0x-2 result
]

test-walk-0x0-E-2-returns-2x0: func [
  /local test-title result
] [
  test-title: "Walk E 2 from 0x0 Returns  2x0"

  result: walk 0x0 'E 2

  report test-title 2x0 result
]

test-walk-0x0-W-2-returns--2x0: func [
  /local test-title result
] [
  test-title: "Walk W 2 from 0x0 Returns -2x0"

  result: walk 0x0 'W 2

  report test-title -2x0 result
]

test-walk-0x0-N-2-returns-0x2
test-walk-0x0-S-2-returns-0x-2
test-walk-0x0-E-2-returns-2x0
test-walk-0x0-W-2-returns--2x0

test1a: func [
  { Following R2, L3 leaves you two blocks East and three blocks North. }
  /local test-title directions location
] [
  test-title: "Test 1a"

  directions: [ R2 L3 ]

  location: travel directions

  report test-title 2x3 location
]

test1b: func [
  { Following R2, L3 leaves you five blocks away. }
  /local test-title directions location
] [
  test-title: "Test 1b"

  directions: [ R2 L3 ]

  location: travel directions

  report test-title 5 (distance 0x0 location)
]

test2a: func [
  { R2, R2, R2 leaves you two blocks due South of your starting position. }
  /local test-title directions location
] [
  test-title: "Test 2a"

  directions: [ R2 R2 R2 ]

  location: travel directions

  report test-title 0x-2 location
]

test2b: func [
  { R2, R2, R2 leaves you two blocks from your starting position. }
  /local test-title directions location
] [
  test-title: "Test 2b"

  directions: [ R2 R2 R2 ]

  location: travel directions

  report test-title 2 (distance 0x0 location)
]

test3a: func [
  { R5, L5, R5, R3 leaves you 12 blocks away. }
  /local test-title directions location
] [
  test-title: "Test 3a"

  directions: [ R5 L5 R5 R3 ]

  location: travel directions

  report test-title 10x2 location
]

test3b: func [
  { R5, L5, R5, R3 leaves you 12 blocks away. }
  /local test-title directions location
] [
  test-title: "Test 3b"

  directions: [ R5 L5 R5 R3 ]

  location: travel directions

  report test-title 12 (distance 0x0 location)
]

test1a
test1b
test2a
test2b
test3a
test3b

testB: func [
  { R8, R4, R4, R8, the first location you visit twice is four blocks away. }
  /local test-title directions location
] [
  test-title: "Test B"

  directions: [ R8 R4 R4 R8 ]

  location: travel-b directions

  report test-title 4x0 location
]

testB
