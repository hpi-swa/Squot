tests
testMergeGenerated

	self flag: #TODO "To be readded".
	self assert: true.
"	<timeout: 20>
	self 
		write: self dummyContents2 
		to: self dummyFile2 
		in: self otherReference.
	self 
		commitOtherMessaged: 'Added dummy2';
		createDummyFile.
	[self transferMessaged: 'Added dummy1'] on: Exception do: [:e | self halt: e. e resume.].

	self 	
		assert: (self otherCommit tree entries includesKey: self dummyFile);
		assert: (self otherCommit tree entries includesKey: self dummyFile2)."