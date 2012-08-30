tests
testFanoutTableCreation
	| orderedHashes hashDict creator fanoutStream hashes |
	hashes := {
		#[0 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 217 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[235 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger }.
	orderedHashes := OrderedCollection
		with: hashes first asInteger
		with: hashes second asInteger
		with: hashes third asInteger
		with: hashes fourth asInteger.
	hashDict := Dictionary
		with: hashes first asInteger -> (21 asByteArrayOfSize: 4)
		with: hashes second asInteger -> (22 asByteArrayOfSize: 4)
		with: hashes third asInteger -> (23 asByteArrayOfSize: 4)
		with: hashes fourth asInteger -> (24 asByteArrayOfSize: 4).
	creator := GitPackFileCreator new.
	creator 
		instVarNamed: 'orderedHashes' put: orderedHashes;
		instVarNamed: 'hashDict' put: hashDict.
	
	fanoutStream := (ByteArray streamContents: [ :stream | creator writeFanoutTableOn: stream ]) readStream.
	
	self assert: fanoutStream size equals: 1024.
	self assert: 21 equals: ((fanoutStream position: 0) next: 4) asInteger.
	self assert: 23 equals: ((fanoutStream position: (20 * 4)) next: 4) asInteger.
	self assert: 24 equals: ((fanoutStream position: (235 * 4)) next: 4) asInteger