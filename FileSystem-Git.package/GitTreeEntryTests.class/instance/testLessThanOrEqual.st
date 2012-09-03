tests
testLessThanOrEqual
	| entry1 entry2 entry3 entry4 entry5 hash |
	hash := SecureHashAlgorithm new hashMessage: #[1 2 3].
	entry1 := GitTreeEntry 
		fileNamed: 'Connencton.doc'
		hash: hash
		in: repository.
	entry2 := GitTreeEntry 
		fileNamed: 'GitFS note.txt'
		hash: hash
		in: repository.
	entry3 := GitTreeEntry
		fileNamed: 'dummy.docx'
		hash: hash
		in: repository.
	entry4 := GitTreeEntry
		directoryNamed: 'aFolder'
		hash: hash
		in: repository.
	entry5 := GitTreeEntry
		directoryNamed: 'aFolder'
		hash: hash
		in: repository.
	
	self assert: entry1 <= entry2.
	self assert: entry1 <= entry3.
	self assert: entry2 <= entry3. "asciiValue of $G is smaller than that of $d"
	self assert: entry5 <= entry4 "entries for tree objects are compared with a trailing slash"