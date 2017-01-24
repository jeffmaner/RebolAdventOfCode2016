Rebol [
  Title: "Rebol Advent of Code 2016 Day 1"
  Usage: { "do %01.r" }
]

orientations: [ N S E W ]

turn: func [
  current-orientation
  new-orientation [ char! ]
] [
  switch new-orientation reduce [
    #"R" [ switch current-orientation [
          N [ 'E ]
          S [ 'W ]
          E [ 'S ]
          W [ 'N ]
        ] ]
    #"L" [ switch current-orientation [
          N [ 'W ]
          S [ 'E ]
          E [ 'N ]
          W [ 'S ]
        ] ]
  ]
]

walk: func [
  current-location [ pair! ]
  orientation
  blocks-to-walk [ integer! ]
] [
  switch orientation reduce [
    'N [ current-location + to-pair reduce [ 0 blocks-to-walk ] ]
    'S [ current-location - to-pair reduce [ 0 blocks-to-walk ] ]
    'E [ current-location + to-pair reduce [ blocks-to-walk 0 ] ]
    'W [ current-location - to-pair reduce [ blocks-to-walk 0 ] ]
  ]
]

walk-b: func [
  current-location [ pair! ]
  orientation
  blocks-to-walk [ integer! ]

  /local pairs new-location
] [
  pairs: copy []
  new-location: current-location

  for n 1 blocks-to-walk 1 [
    switch orientation reduce [
      'N [ new-location: new-location + 0x1 ]
      'S [ new-location: new-location - 0x1 ]
      'E [ new-location: new-location + 1x0 ]
      'W [ new-location: new-location - 1x0 ]
    ]

    append pairs new-location
  ]

  pairs
]

distance: func [
  origin [ pair! ]
  destination [ pair! ]
] [
  abs (abs destination/x - abs origin/x) + abs (abs destination/y - abs origin/y)
]

travel: func [
  directions [ series! ]

  /local location orientation d e f
] [
  location: 0x0
  orientation: 'N

  foreach d directions [
    e: to-string d
    orientation: turn orientation e/1
    f: remove/part e 1
    location: walk location orientation (to-integer f)
  ]

  location
]

find-already-visited: func [
  unique-pairs [ series! ]
  pairs [ series! ]

  /local p n
] [
  p: 0x0

  for n 1 length? unique-pairs 1 [
    unless pairs/(n) = unique-pairs/(n) [
      p: pairs/(n)
      break
    ]
  ]

  p
]

travel-b: func [
  directions [ series! ]

  /local locations-visited orientation locations d e f
] [
  location: 0x0
  orientation: 'N
  locations: copy []

  foreach d directions [
    e: to-string d
    orientation: turn orientation e/1
    f: remove/part e 1
    locations-visited: walk-b location orientation (to-integer f)
    append locations locations-visited
    location: last locations-visited
  ]

  unique-locations: unique locations

  find-already-visited unique-locations locations
]

directions: [
  R5 R4 R2 L3 R1 R1 L4 L5 R3 L1 L1 R4 L2 R1 R4 R4 L2 L2 R4 L4 R1 R3 L3 L1 L2 R1
  R5 L5 L1 L1 R3 R5 L1 R4 L5 R5 R1 L185 R4 L1 R51 R3 L2 R78 R1 L4 R188 R1 L5 R5
  R2 R3 L5 R3 R4 L1 R2 R2 L4 L4 L5 R5 R4 L4 R2 L5 R2 L1 L4 R4 L4 R2 L3 L4 R2 L3
  R3 R2 L2 L3 R4 R3 R1 L4 L2 L5 R4 R4 L1 R1 L5 L1 R3 R1 L2 R1 R1 R3 L4 L1 L3 R2
  R4 R2 L2 R1 L5 R3 L3 R3 L1 R4 L3 L3 R4 L2 L1 L3 R2 R3 L2 L1 R4 L3 L5 L2 L4 R1
  L4 L4 R3 R5 L4 L1 L1 R4 L2 R5 R1 R1 R2 R1 R5 L1 L3 L5 R2
]

destination: travel directions
blocks-away: distance 0x0 destination
print reform [ "Easter Bunny HQ is" blocks-away "blocks away." ]

destination-b: travel-b directions
blocks-away-b: distance 0x0 destination-b
print reform [ "Oops! Easter Bunny HQ is actually" blocks-away-b "blocks away!" ]
print ""

