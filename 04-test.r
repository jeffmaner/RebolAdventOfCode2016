Rebol [
  Title: "Rebol Advent of Code 2016 Day 4 Tests"
  Usage: { "do %04-test.r" }
]

do load %04.r
do load %ancillary.r

test-room-aaaaa-bbb-z-y-x-123_abxyz_-is-real-room: func [
  /local test-title room result
] [
  test-title: "Room aaaaa-bbb-z-y-x-123[abxyz] is a Room"

  room: parse-room "aaaaa-bbb-z-y-x-123[abxyz]"

  result: is-real-room? room

  report test-title true result
]

test-room-aaaaa-bbb-z-y-x-123_abxyz_-is-real-room

test-room-a-b-c-d-e-f-g-h-987_abcde_-is-real-room: func [
  /local test-title room result
] [
  test-title: "Room a-b-c-d-e-f-g-h-987[abcde] is a Room"

  room: parse-room "a-b-c-d-e-f-g-h-987[abcde]"

  result: is-real-room? room

  report test-title true result
]

test-room-a-b-c-d-e-f-g-h-987_abcde_-is-real-room

test-room-not-a-real-room-404_oarel_-is-real-room: func [
  /local test-title room result
] [
  test-title: "Room not-a-real-room-404[oarel] is a Room"

  room: parse-room "not-a-real-room-404[oarel]"

  result: is-real-room? room

  report test-title true result
]

test-room-not-a-real-room-404_oarel_-is-real-room

test-room-totally-real-room-200_decoy_-is-not-real-room: func [
  /local test-title room result
] [
  test-title: "Room totally-real-room-200[decoy] is a Room"

  room: parse-room "totally-real-room-200[decoy]"

  result: is-real-room? room

  report test-title false result
]

test-room-totally-real-room-200_decoy_-is-not-real-room

test-sum-of-sector-ids-is-1514: func [
  /local test-title rooms sector-ids room parsed-room result
] [
  test-title: "The Sum of the Sector IDs is 1514"

  rooms: [
    "aaaaa-bbb-z-y-x-123[abxyz]"
    "a-b-c-d-e-f-g-h-987[abcde]"
    "not-a-real-room-404[oarel]"
    "totally-real-room-200[decoy]"
  ]

  sector-ids: copy []
  foreach room rooms [
    parsed-room: parse-room room
    if is-real-room? parsed-room [
      append sector-ids parsed-room/sector-id
    ]
  ]

  result: 0
  foreach sector-id sector-ids [
    result: result + to-integer sector-id
  ]

  report test-title 1514 result
]

test-sum-of-sector-ids-is-1514

test-qzmt-zixmtkozy-ivhz-343-is-very-encrypted-name: func [
  /local test-title result
] [
  test-title: "Room qzmt-zixmtkozy-ivhz-343 translates to 'very encrypted name'"

  result: decrypt-name "qzmt-zixmtkozy-ivhz" "343"

  report test-title "very encrypted name" result
]

test-qzmt-zixmtkozy-ivhz-343-is-very-encrypted-name
