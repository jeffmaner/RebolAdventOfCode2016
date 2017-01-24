Rebol [
  Title: "Rebol Advent of Code 2016 Day 5"
  Usage: { "do %05.r" }
  Remarks: { Takes a while to run. }
]

calculate-password: func [
  door-id [ string! ]
  /local index password c hash bit-sum
] [
  index: -1
  password: copy ""

  for c 1 8 1 [
    hash: copy ""

    until [
      index: index + 1

      hash: checksum/method rejoin [ door-id index ] 'MD5

      bit-sum: hash/1 + hash/2

      (bit-sum = 0) and (hash/3 < 16)
    ]

    append password lowercase last to-hex hash/3
  ]

  password
]

actual-door-id: "reyedfim"
print reform [ "The password for door ID" actual-door-id "is" (calculate-password actual-door-id) ]

calculate-password': func [
  door-id [ string! ]
  /local index password hash bit-sum p c
] [
  index: -1
  password: copy "--------"

  until [
    hash: copy ""

    until [
      index: index + 1

      hash: checksum/method rejoin [ door-id index ] 'MD5

      bit-sum: hash/1 + hash/2

      (bit-sum = 0) and (hash/3 < 16)
    ]

    b: hash/3
    p: 1 + either b < 16 [ b ] [ 255 - b ]
    c: pick lowercase to-hex hash/4 7

    if  ((p > 0) and (p < 9)) and (password/(p) = #"-") [
      password/(p): c
    ]

    none = find password #"-"
  ]

  password
]

print reform [ "The password' for door ID" actual-door-id "is" (calculate-password' actual-door-id) ]
