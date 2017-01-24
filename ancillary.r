Rebol [
  Title: "Rebol Advent of Code 2016 Ancillary Support"
  Usage: { "do load %ancillary.r" }
]

report: func [
  test-title [ string! ] "Human-readable test title."
  expected               "Expected value."
  actual                 "Actual value."

  /local s
] [
  s: either expected = actual [
    ": Pass."
  ] [
    rejoin [ ": Fail (" actual ")" ]
  ]

  print rejoin [ test-title s ]
]

item-counts: func [
  series [ series! ]
  /local counts k v
] [
  counts: copy []

  foreach item series [
    k: find counts item
    either k = none [
      append counts reduce [ item 1 ]
    ] [
      v: pick next k 1
      change next find counts item (v + 1)
    ]
  ]

  head counts
]

