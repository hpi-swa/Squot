tests-index
testFanoutByte0
	| fanout |
	creator 
		instVarNamed: 'sortedHashes' 
		put: {#[0 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger}.
	fanout := creator fanoutOffsets.
	self assert: 256 equals: fanout contents size.
	fanout do: [ :offset |
		self assert: 1 equals: offset asInteger ].
	
	creator 
		instVarNamed: 'sortedHashes' 
		put: {#[3 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger}.
	fanout := creator fanoutOffsets.
	self assert: 256 equals: fanout contents size.
	self assert: 0 equals: fanout first asInteger.
	self assert: 0 equals: fanout second asInteger.
	self assert: 0 equals: fanout third asInteger.
	(fanout allButFirst: 3) do: [ :offset |
		self assert: 1 equals: offset asInteger ]