tests-index
testFanoutTableCreation
	"byte N records the number of objects with names <= N.
	Consequence: byte 255 records the *total* number of objects in the pack"
	|  Name is already defined fanoutStream previous |	
	fanoutStream := (ByteArray streamContents: [ :stream | creator writeFanoutTableOn: stream ]) readStream.
	
	"the offsets in the fanout table are monotonic"
	previous := 0.
	[ fanoutStream atEnd ] whileFalse: [ | current |
		current := (fanoutStream next: 4) asInteger.
		self assert:  current >= previous.
		 previous := current ].
	
	self assert: fanoutStream size equals: 1024.
	self assert: 1 equals: ((fanoutStream position: 0) next: 4) asInteger.
	self assert: 4 equals: ((fanoutStream position: (20 * 4)) next: 4) asInteger.
	self assert: 5 equals: ((fanoutStream position: (235 * 4)) next: 4) asInteger.
	self assert: 6 equals: ((fanoutStream position: (236 * 4)) next: 4) asInteger.
	self assert: 7 equals: ((fanoutStream position: (255 * 4)) next: 4) asInteger.