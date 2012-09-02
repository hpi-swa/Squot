tests
testHighestOrderedHashes
	| creator bytes |
	creator := GitPackFileCreator new.
	creator instVarNamed: 'orderedHashes' put: {
		#[0 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 217 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 217 1 54 99 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[235 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[236 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[255 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger }.
	creator instVarNamed: 'hashDict' put: (Dictionary new
		add: #[0 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 21;
		add: #[20 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 22;
		add: #[20 217 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 23;
		add: #[20 217 1 54 99 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 24;
		add: #[235 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 25;
		add: #[236 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 26;
		add: #[255 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger -> 27;
		yourself).
		
	bytes := creator fanoutOffsets.
	self assert: 256 equals: bytes size.
	self assert: 5 equals: (bytes select: [ :assoc | assoc value ~= #[0 0 0 0] ]) size.
	self assert: 21 equals: (bytes at: 0 + 1).
	self assert: 24 equals: (bytes at: 20+ 1).
	self assert: 25 equals: (bytes at: 235 + 1).
	self assert: 26 equals: (bytes at: 236 + 1).
	self assert: 27 equals: (bytes at: 255+ 1)