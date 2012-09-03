tests
testRemoveEntry
	| tree collection entry1 entry2 entry3 |
	entry1 := GitTreeEntry
		fileNamed: 'entry 1'
		hash: 1
		in: nil.
	entry2 := GitTreeEntry
		fileNamed: 'entry 2'
		hash: 2
		in: nil.
	entry3 := GitTreeEntry
		fileNamed: 'entry 3'
		hash: 3
		in: nil.
	collection := OrderedCollection new add: entry1; add: entry2; add: entry3; yourself.
	tree := GitTree entries: collection in: nil.
	
	self assert: tree entries size = 3.
	self assert: (tree entries includesKey: entry1 entryName).
	self assert: (tree entries includesKey: entry2 entryName).
	self assert: (tree entries includesKey: entry3 entryName).
	
	tree removeEntryAt: entry2 entryName.
	self assert: tree entries size = 2.
	self deny: (tree entries includesKey: entry2 entryName).
	
	tree removeEntryAt: entry3 entryName.
	self assert: tree entries size = 1.
	self deny: (tree entries includesKey: entry3 entryName).
	
	tree removeEntryAt: entry1 entryName.
	self assert: tree entries isEmpty