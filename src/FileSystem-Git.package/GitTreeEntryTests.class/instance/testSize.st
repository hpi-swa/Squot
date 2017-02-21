tests
testSize
	| treeEntry fileName mode  blob sizeToBe |
	fileName := 'testFile'.
	mode := GitTreeEntry printMode: GitTreeEntry fileMode.
	blob := GitBlob bytes: 'fooBlob' in: nil.
	treeEntry :=
		GitTreeEntry 
			fileNamed: fileName 
			hash: blob hash
			in: repository.
					
	sizeToBe := 
		(mode size) +
		(Character space asInteger asByteArray size) +
		(fileName size) +
		(0 decimalDigitLength) +
		(blob hash size).
	
	self assert: blob hexHash size = 40.
	self assert: blob hash size = 20.
	self assert: sizeToBe = 36.
	self assert: treeEntry size = sizeToBe.