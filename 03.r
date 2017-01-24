Rebol [
  Title: "Rebol Advent of Code 2016 Day 3"
  Usage: { "do %03.r" }
]

do load %03-input.r

can-be-triangle: func [
  sides
  /local sides-1-and-2 sides-2-and-3 sides-3-and-1
] [
  sides-1-and-2: sides/1 + sides/2
  sides-2-and-3: sides/2 + sides/3
  sides-3-and-1: sides/3 + sides/1

  (sides-1-and-2 > sides/3) and
  (sides-2-and-3 > sides/1) and
  (sides-3-and-1 > sides/2)
]

possible-triangles: copy []
forskip dimensions 3 [
  sides: copy []
  sides: reduce [ first dimensions second dimensions third dimensions ]

  if can-be-triangle sides [
    append/only possible-triangles sides
  ]
]

regroup: func [
  sides
  /local new-sides sets s new-sides-1 new-sides-2 new-sides-3 n
] [
  new-sides: copy []
  sets: ((length? sides) / 3) / 3

  for s 0 sets - 1 1 [
    new-sides-1: copy []
    new-sides-2: copy []
    new-sides-3: copy []

    for n 1 9 3 [
      append new-sides-1 sides/(s * 9 + (n + 0))
      append new-sides-2 sides/(s * 9 + (n + 1))
      append new-sides-3 sides/(s * 9 + (n + 2))
    ]

    append new-sides new-sides-1
    append new-sides new-sides-2
    append new-sides new-sides-3
  ]

  new-sides
]

possible-triangles': copy []
dimensions': regroup dimensions
forskip dimensions' 3 [
  sides: copy []
  sides: reduce [ first dimensions' second dimensions' third dimensions' ]

  if can-be-triangle sides [
    append/only possible-triangles' sides
  ]
]

print reform [ length? possible-triangles "can be triangles." ]
print reform [ "After regrouping," length? possible-triangles' "can be triangles." ]
print ""

