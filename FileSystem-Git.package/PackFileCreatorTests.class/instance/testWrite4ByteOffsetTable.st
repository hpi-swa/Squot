tests-index
testWrite4ByteOffsetTable
	| byteStream |
	byteStream := (ByteArray streamContents: [ :stream | creator writeOffsetTablesOn: stream ]) readStream.
	self assert: 4 * 7 equals: byteStream contents size.
	
	self deny: byteStream atEnd.
	[ byteStream atEnd ] whileFalse: [ | offset |
		offset := (byteStream next: 4) asInteger.
		"MSB is zero if the 8-byte offset table isn' used"
		self assert: 0 equals: (offset bitShift: -31).
		self assert:  offset <= (6 * 20) ].

	"smallest offset is always 12 because of 12 header bytes"	
	self assert: 12 equals: ((byteStream position: 0) next: 4) asInteger