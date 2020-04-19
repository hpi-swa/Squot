tests
testEvictsLargestObjects
	| blob1 blob2 cache repo blob3 |
	cache := GitObjectCache new.
	repo := Object new.
	blob1 := GitBlob bytes: (ByteArray new: cache thresholdSize) in: repo.
	blob2 := GitBlob bytes: #[1 2 3 4] in: repo.
	blob3 := GitBlob bytes: #[2 3 4 5] in: repo.
	cache at: blob1 hexHash ifAbsentPut: [blob1].
	cache at: blob2 hexHash ifAbsentPut: [blob2].
	self assert: nil equals: (cache at: blob1 hexHash ifAbsent: []);
		assert: blob2 equals: (cache at: blob2 hexHash ifAbsent: []).
	cache at: blob3 hexHash ifAbsentPut: [blob3].
	self assert: blob2 equals: (cache at: blob2 hexHash ifAbsent: []);
		assert: blob3 equals: (cache at: blob3 hexHash ifAbsent: []).