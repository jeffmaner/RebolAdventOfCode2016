Rebol [
  Title: "Rebol Advent of Code 2016 Day 4"
  Usage: { "do %04.r" }
]

do load %04-input.r
do load %ancillary.r

rooms: copy []
rooms: parse rooms-input to-string newline

parse-room: func [
  room
  /local alpha digit pieces name sector-id checksum
] [
  alpha: charset [ #"a" - #"z" ]
  digit: charset "0123456789"

  pieces: copy []
  pieces: parse room "-"
  pieces: rejoin pieces

  name:      copy ""
  sector-id: copy ""
  checksum:  copy ""

  parse pieces [ copy name      [ some alpha ]
                 copy sector-id [ some digit ]
                 "["
                 copy checksum  [ some alpha ]
                 "]" ]

  reduce [ 'name name 'sector-id sector-id 'checksum checksum ]
]

is-real-room?: func [
  room

  /local letter-counts counts ranked-letters valid c
] [
  letter-counts: copy []
  letter-counts: item-counts room/name

  sort-func: func [
    a b
  ] [
    ((a/count = b/count) and (a/letter < b/letter)) or
    (a/count > b/count)
  ]

  counts: copy []
  for c 1 length? letter-counts 2 [
    append/only counts reduce [ 'letter letter-counts/(c) 'count letter-counts/(c + 1) ]
  ]

  ranked-letters: copy []
  ranked-letters: sort/compare counts func [a b] [sort-func a b]

  valid: true
  for c 1 5 1 [
    unless room/checksum/(c) = ranked-letters/(c)/letter [
      valid: false
    ]
  ]

  valid
]

decrypt-name: func [
  name [ string! ]
  sector-id [ string! ]

  /local text shifts c
] [
  ;; Magic numbers seem more legible here than named constants.
  ;;
  ;; But just in case:
  ;; 97 is the ASCII value of miniscule a, and
  ;; 26 is the number of letters in the alphabet.

  shifts: mod to-integer sector-id 26

  text: copy ""
  foreach c name [
    append text either c = #"-" [
      #" "
    ] [
      to-char (97 + mod (shifts + to-integer c - 97) 26)
    ]
  ]

  text
]

sector-ids: copy []
foreach room rooms [
  parsed-room: parse-room room
  if is-real-room? parsed-room [
    append sector-ids parsed-room/sector-id
  ]
]

sum-of-sector-ids: 0
foreach sector-id sector-ids [
  sum-of-sector-ids: sum-of-sector-ids + to-integer sector-id
]

np-sector-id: 0
rooms: head rooms
foreach room rooms [
  parsed-room: parse-room room
  if is-real-room? parsed-room [
    decrypted-name: decrypt-name parsed-room/name parsed-room/sector-id
    unless (find decrypted-name "north") = none [
      np-sector-id: parsed-room/sector-id
      break
    ]
  ]
]

print reform [ "The sum of the sector IDs of the real rooms is" sum-of-sector-ids ]
print reform [ "The sector ID of the room where North Pole objects are stored is" np-sector-id ]
print ""

