initialize-release
initialize
	cache := Dictionary new.
	totalSize := 0 "bytes".
	objectsSortedBySize := self sizeHeap.
	commitsSortedByLastAccess := self commitsHeap.
	thresholdSize := self defaultThresholdSize.
	hits := 0.
	misses := 0.
	evictions := 0.