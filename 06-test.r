Rebol [
  Title: "Rebol Advent of Code 2016 Day 6 Tests"
  Usage: { "do %06-test.r" }
]

do load %06.r
do load %ancillary.r

messages: {
  eedadn
  drvtee
  eandsr
  raavrd
  atevrs
  tsrnev
  sdttsa
  rasrtv
  nssdts
  ntnada
  svetve
  tesnvt
  vntsnd
  vrdear
  dvrsen
  enarar
}

test-1-input-yields-easter: func [
  /local test-title messages' result
] [
  test-title: "Test input yields easter"

  messages': parse messages to-string newline

  result: correct-errors messages' func [s] [ maximum-of s]

  report test-title "easter" result
]

test-1-input-yields-easter

test-2-input-yields-advent: func [
  /local test-title messages' result
] [
  test-title: "Test input yields advent"

  messages': parse messages to-string newline

  result: correct-errors messages' func [s] [ minimum-of s ]

  report test-title "advent" result
]

test-2-input-yields-advent
