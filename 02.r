Rebol [
  Title: "Rebol Advent of Code 2016 Day 2"
  Usage: { "do %02.r" }
]

instructions: [
  DLRURUDLULRDRUDDRLUUUDLDLDLRLRRDRRRLLLLLDDRRRDRRDRRRLRRURLRDUULRLRRDDLULRLLDUDLULURRLRLDUDLURURLDRDDULDRDRDLDLLULULLDDLRRUDULLUULRRLLLURDRLDDLDDLDRLRRLLRURRUURRRRLUDLRDDDDRDULRLLDDUURDUDRLUDULLUDLUDURRDRDUUUUDDUDLLLRLUULRUURDLRLLRRLRLLDLLRLLRRRURLRRLURRLDLLLUUDURUDDLLUURRDRDRRDLLDDLLRDRDRRLURLDLDRDLURLDULDRURRRUDLLULDUDRURULDUDLULULRRRUDLUURRDURRURRLRRLLRDDUUUUUDUULDRLDLLRRUDRRDULLLDUDDUDUURLRDLULUUDLDRDUUUDDDUDLDURRULUULUUULDRUDDLLLDLULLRLRLUDULLDLLRLDLDDDUUDURDDDLURDRRDDLDRLLRLRR
  RLDUDURDRLLLLDDRRRURLLLRUUDDLRDRDDDUDLLUDDLRDURLDRDLLDRULDDRLDDDRLDRDDDRLLULDURRRLULDRLRDRDURURRDUDRURLDRLURDRLUULLULLDLUDUDRDRDDLDDDDRDURDLUDRDRURUDDLLLRLDDRURLLUDULULDDLLLDLUDLDULUUDLRLURLDRLURURRDUUDLRDDDDDRLDULUDLDDURDLURLUURDLURLDRURRLDLLRRUDRUULLRLDUUDURRLDURRLRUULDDLDLDUUDDRLDLLRRRUURLLUURURRURRLLLUDLDRRDLUULULUDDULLUDRLDDRURDRDUDULUDRLRRRUULLDRDRLULLLDURURURLURDLRRLLLDRLDUDLLLLDUUURULDDLDLLRRUDDDURULRLLUDLRDLUUDDRDDLLLRLUURLDLRUURDURDDDLLLLLULRRRURRDLUDLUURRDRLRUDUUUURRURLRDRRLRDRDULLDRDRLDURDDUURLRUDDDDDLRLLRUDDDDDURURRLDRRUUUDLURUUDRRDLLULDRRLRRRLUUUD
  RDRURLLUUDURURDUUULLRDRLRRLRUDDUDRURLLDLUUDLRLLDDURRURLUDUDDURLURLRRURLLURRUDRUDLDRLLURLRUUURRUDDDURRRLULLLLURDLRLLDDRLDRLLRRDLURDLRDLDUDRUULLDUUUDLURRLLRUDDDUUURLURUUDRLRULUURLLRLUDDLLDURULLLDURDLULDLDDUDULUDDULLRDRURDRRLLDLDDDDRUDLDRRLLLRLLLRRULDLRLRLRLLDLRDRDLLUDRDRULDUURRDDDRLLRLDLDRDUDRULUDRDLDLDDLLRULURLLURDLRRDUDLULLDLULLUDRRDDRLRURRLDUDLRRUUDLDRLRLDRLRRDURRDRRDDULURUUDDUUULRLDRLLDURRDLUULLUDRDDDLRUDLRULLDDDLURLURLRDRLLURRRUDLRRLURDUUDRLRUUDUULLRUUUDUUDDUURULDLDLURLRURLRUDLULLULRULDRDRLLLRRDLU
  RRRRDRLUUULLLRLDDLULRUUURRDRDRURRUURUDUULRULULRDRLRRLURDRRRULUUULRRUUULULRDDLLUURRLLDUDRLRRLDDLDLLDURLLUDLDDRRURLDLULRDUULDRLRDLLDLRULLRULLUDUDUDDUULDLUUDDLUDDUULLLLLURRDRULURDUUUDULRUDLLRUUULLUULLLRUUDDRRLRDUDDRULRDLDLLLLRLDDRRRULULLLDLRLURRDULRDRDUDDRLRLDRRDLRRRLLDLLDULLUDDUDDRULLLUDDRLLRRRLDRRURUUURRDLDLURRDLURULULRDUURLLULDULDUDLLULDDUURRRLDURDLUDURLDDRDUDDLLUULDRRLDLLUDRDURLLDRLDDUDURDLUUUUURRUULULLURLDUUULLRURLLLUURDULLUULDRULLUULRDRUULLRUDLDDLRLURRUUDRLRRRULRUUULRULRRLDLUDRRLL
  ULRLDLLURDRRUULRDUDDURDDDLRRRURLDRUDDLUDDDLLLRDLRLLRRUUDRRDRUULLLULULUUDRRRDRDRUUUUULRURUULULLULDULURRLURUDRDRUDRURURUDLDURUDUDDDRLRLLLLURULUDLRLDDLRUDDUUDURUULRLLLDDLLLLRRRDDLRLUDDUULRRLLRDUDLLDLRRUUULRLRDLRDUDLLLDLRULDRURDLLULLLRRRURDLLUURUDDURLDUUDLLDDRUUDULDRDRDRDDUDURLRRRRUDURLRRUDUDUURDRDULRLRLLRLUDLURUDRUDLULLULRLLULRUDDURUURDLRUULDURDRRRLLLLLUUUULUULDLDULLRURLUDLDRLRLRLRDLDRUDULDDRRDURDDULRULDRLRULDRLDLLUDLDRLRLRUDRDDR
]

do-line: func [
  line
  current-key

  /local key
] [
  key: current-key

  foreach c to-string line [
    switch c [
      #"U" [ switch key [
               1 [ key: 1 ]
               2 [ key: 2 ]
               3 [ key: 3 ]
               4 [ key: 1 ]
               5 [ key: 2 ]
               6 [ key: 3 ]
               7 [ key: 4 ]
               8 [ key: 5 ]
               9 [ key: 6 ]
             ] ]
      #"D" [ switch key [
               1 [ key: 4 ]
               2 [ key: 5 ]
               3 [ key: 6 ]
               4 [ key: 7 ]
               5 [ key: 8 ]
               6 [ key: 9 ]
               7 [ key: 7 ]
               8 [ key: 8 ]
               9 [ key: 9 ]
             ] ]
      #"L" [ switch key [
               1 [ key: 1 ]
               2 [ key: 1 ]
               3 [ key: 2 ]
               4 [ key: 4 ]
               5 [ key: 4 ]
               6 [ key: 5 ]
               7 [ key: 7 ]
               8 [ key: 7 ]
               9 [ key: 8 ]
             ] ]
      #"R" [ switch key [
               1 [ key: 2 ]
               2 [ key: 3 ]
               3 [ key: 3 ]
               4 [ key: 5 ]
               5 [ key: 6 ]
               6 [ key: 6 ]
               7 [ key: 8 ]
               8 [ key: 9 ]
               9 [ key: 9 ]
             ] ]
    ]
  ]

  key
]

do-line-actual: func [
  line
  current-key

  /local key
] [
  key: current-key

  foreach c to-string line [
    switch c [
      #"U" [ switch key [
               #"1" [ key: #"1" ]
               #"2" [ key: #"2" ]
               #"3" [ key: #"1" ]
               #"4" [ key: #"4" ]
               #"5" [ key: #"5" ]
               #"6" [ key: #"6" ]
               #"7" [ key: #"3" ]
               #"8" [ key: #"4" ]
               #"9" [ key: #"9" ]
               #"A" [ key: #"6" ]
               #"B" [ key: #"7" ]
               #"C" [ key: #"8" ]
               #"D" [ key: #"B" ]
             ] ]
      #"D" [ switch key [
               #"1" [ key: #"3" ]
               #"2" [ key: #"6" ]
               #"3" [ key: #"7" ]
               #"4" [ key: #"8" ]
               #"5" [ key: #"5" ]
               #"6" [ key: #"A" ]
               #"7" [ key: #"B" ]
               #"8" [ key: #"C" ]
               #"9" [ key: #"9" ]
               #"A" [ key: #"A" ]
               #"B" [ key: #"D" ]
               #"C" [ key: #"C" ]
               #"D" [ key: #"D" ]
             ] ]
      #"L" [ switch key [
               #"1" [ key: #"1" ]
               #"2" [ key: #"2" ]
               #"3" [ key: #"2" ]
               #"4" [ key: #"3" ]
               #"5" [ key: #"5" ]
               #"6" [ key: #"5" ]
               #"7" [ key: #"6" ]
               #"8" [ key: #"7" ]
               #"9" [ key: #"8" ]
               #"A" [ key: #"A" ]
               #"B" [ key: #"A" ]
               #"C" [ key: #"B" ]
               #"D" [ key: #"D" ]
             ] ]
      #"R" [ switch key [
               #"1" [ key: #"1" ]
               #"2" [ key: #"3" ]
               #"3" [ key: #"4" ]
               #"4" [ key: #"4" ]
               #"5" [ key: #"6" ]
               #"6" [ key: #"7" ]
               #"7" [ key: #"8" ]
               #"8" [ key: #"9" ]
               #"9" [ key: #"9" ]
               #"A" [ key: #"B" ]
               #"B" [ key: #"C" ]
               #"C" [ key: #"C" ]
               #"D" [ key: #"D" ]
             ] ]
    ]
  ]

  key
]

do-instructions: func [
  instructions [ block! ]
  /local keys current-key
] [
  keys: copy []
  current-key: 5

  foreach i instructions [
    current-key: do-line i current-key
    append keys current-key
  ]

  keys
]

do-instructions-actual: func [
  instructions [ block! ]
  /local keys current-key
] [
  keys: copy []
  current-key: #"5"

  foreach i instructions [
    current-key: do-line-actual i current-key
    append keys current-key
  ]

  keys
]

code: rejoin do-instructions instructions
print reform [ "Bathroom code:" code ]

code-actual: rejoin do-instructions-actual instructions
print reform [ "Actual bathroom code:" code-actual ]
print ""

