accessing
offsetForIndex: index
	| offset |
	fourByteOffsetStream position: (index * 4).
	offset := (fourByteOffsetStream next: 4) asInteger.
	"if there are more than 2GB entries (MSB set to 1), lookup in 8-byte offset table"
	^ (offset >= 16r80000000)
		ifFalse: [ offset ]
		ifTrue: [ 
			eightByteOffsetStream position: ((offset bitAnd: 16r7FFFFFFF) * 8).
			(eightByteOffsetStream next: 8) asInteger ]