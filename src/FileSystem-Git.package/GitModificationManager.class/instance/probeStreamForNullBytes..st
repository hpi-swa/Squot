private
probeStreamForNullBytes: aStream
	"see Git's xdiff-interface.c::buffer_is_binary"
	| probeSize oldPosition |
	oldPosition := aStream position.
	probeSize := 8000.
	[probeSize timesRepeat:
		[aStream atEnd ifTrue: [^ false].
		aStream next == 0 ifTrue: [^ true]]]
	ensure: [aStream position: oldPosition].
	^ false