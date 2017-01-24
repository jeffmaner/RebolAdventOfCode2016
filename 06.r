Rebol [
  Title: "Rebol Advent of Code 2016 Day 6"
  Usage: { "do %06.r" }
]

do load %06-input.r
do load %ancillary.r

correct-errors: func [
  messages [ series! ]
  f [ function! ]

  /local letters characters message c letter-counts counts cs count max-count-chars m
] [
  letters: copy []
  characters: length? first messages

  for c 1 characters 1 [
    append letters copy ""
  ]

  foreach message messages [
    for c 1 characters 1 [
      append letters/(c) message/(c)
    ]
  ]

  letter-counts: copy []
  foreach message letters [
    append/only letter-counts item-counts message
  ]

  counts: copy []
  foreach count letter-counts [
    cs: copy []
    for c 1 length? count 2 [
      append/only cs reduce [ 'count count/(c + 1) 'letter count/(c) ]
    ]

    append/only counts cs
  ]

  f-count-chars: copy []
  foreach c counts [
    m: pick f c 1
    append f-count-chars m/letter
  ]

  rejoin f-count-chars
]

sent-message': parse sent-message to-string newline

print reform [ "The error-corrected message sent reads:" (correct-errors sent-message' func [s] [ maximum-of s ]) ]
print reform [ "Oops! The error-corrected message sent reads:" (correct-errors sent-message' func [s] [ minimum-of s ]) ]
