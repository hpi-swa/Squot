tests-index
testFanoutByte255
	"byte N records the number of objects with names <= N.
	Consequence: byte 255 records the *total* number of objects in the pack"
	| fanout |
	creator 
		instVarNamed: 'sortedHashes' 
		put: {#[254 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger}.
	fanout := creator fanoutOffsets.
	self assert: 256 equals: fanout contents size.
	(fanout allButLast: 2) do: [ :offset |
		self assert: 0 equals: offset asInteger ].
	self assert: 1 equals: (fanout at: 254 + 1) asInteger.
	self assert: 1 equals: (fanout at: 255 + 1) asInteger.
	
	creator 
		instVarNamed: 'sortedHashes' 
		put: {#[255 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger}.
	fanout := creator fanoutOffsets.
	self assert: 256 equals: fanout contents size.
	(fanout allButLast) do: [ :offset |
		self assert: 0 equals: offset asInteger ].
	self assert: 1 equals: (fanout at: 255 + 1) asInteger