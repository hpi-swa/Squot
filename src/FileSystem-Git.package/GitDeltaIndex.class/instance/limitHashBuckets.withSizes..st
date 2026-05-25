computing
limitHashBuckets: hashTable withSizes: bucketSizes
	hashTable doWithIndex: [:each :index | | size |
		(each notNil and: [(size := bucketSizes at: index) > self class hashBucketLimit])
			ifTrue: [self limitHashBucket: each withSize: size]].