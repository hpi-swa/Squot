tests
testAddedObjectsAreRetrievable
	| blob1 cache repo |
	cache := GitObjectCache new.
	repo := Object new.
	blob1 := GitBlob bytes: #[1 2 3 4] in: repo.
	cache at: blob1 hexHash ifAbsentPut: [blob1].
	self assert: blob1 equals: (cache at: blob1 hexHash ifAbsent: [self fail]).