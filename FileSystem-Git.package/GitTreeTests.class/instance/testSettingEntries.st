tests
testSettingEntries
	| collection tree entry1 entry2 |
	collection := OrderedCollection new.
	entry1 := GitTreeEntry 
		fileNamed: 'object1' 
		hash: 234.
	entry2 := GitTreeEntry 
		fileNamed: 'object2' 
		hash: 564.
	collection add: entry1; add: entry2.
	tree := GitTree entries: collection in: nil.
	
	self assert: (tree entries at: entry1 entryName)= entry1.
	self assert: (tree entries at: entry2 entryName) = entry2.
	self deny: entry1 = entry2