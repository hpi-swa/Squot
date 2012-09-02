tests
testLessThanOrEqual
	| entry1 entry2 entry3 entry4 entry5 hash |
	hash := (GitHash from: #[1 2 3]) hash.
	entry1 := GitTreeEntry 
		fileNamed: 'Connencton.doc'
		hash: hash.
	entry2 := GitTreeEntry 
		fileNamed: 'GitFS note.txt'
		hash: hash.
	entry3 := GitTreeEntry
		fileNamed: 'dummy.docx'
		hash: hash.
	entry4 := GitTreeEntry
		directoryNamed: 'aFolder'
		hash: hash.
	entry5 := GitTreeEntry
		directoryNamed: 'aFolder'
		hash: hash.
	
	self assert: entry1 <= entry2.
	self assert: entry1 <= entry3.
	self assert: entry2 <= entry3. "asciiValue of $G is smaller than that of $d"
	self assert: entry5 <= entry4 "entries for tree objects are compared with a trailing slash"