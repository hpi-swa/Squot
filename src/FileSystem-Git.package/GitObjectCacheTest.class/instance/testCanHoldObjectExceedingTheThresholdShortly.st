tests
testCanHoldObjectExceedingTheThresholdShortly
	| blob1 blob2 cache repo |
	cache := GitObjectCache new.
	cache thresholdSize: 100.
	repo := Object new.
	blob1 := GitBlob bytes: #[1 2 3 4] in: repo.
	blob2 := GitBlob bytes: (ByteArray new: cache thresholdSize + 1) in: repo.
	cache at: blob1 hexHash ifAbsentPut: [blob1].
	self assert: blob1 equals: (cache at: blob1 hexHash ifAbsent: []).
	cache at: blob2 hexHash ifAbsentPut: [blob2]. "keeps blob2, evicts blob1"
	self assert: nil equals: (cache at: blob1 hexHash ifAbsent: []);
		assert: blob2 equals: (cache at: blob2 hexHash ifAbsent: []).
	cache at: blob1 hexHash ifAbsentPut: [blob1]. "evicts blob2"
	self assert: nil equals: (cache at: blob2 hexHash ifAbsent: []);
		assert: blob1 equals: (cache at: blob1 hexHash ifAbsent: []).