tests
testEachStoredOnlyOnce
	| blob1 blob2 |
	blob1 := GitBlob bytes: #[1 0 0 0] in: repo.
	blob2 := GitBlob bytes: #[2 0 0 0] in: repo.
	cache thresholdSize: blob1 size * 2.
	cache at: blob1 hexHash ifAbsentPut: [blob1].
	cache at: blob1 hexHash ifAbsentPut: [blob1].
	cache at: blob2 hexHash ifAbsentPut: [blob2]. "would evict blob1 if stored twice"
	self assert: blob1 equals: (cache at: blob1 hexHash ifAbsent: []).