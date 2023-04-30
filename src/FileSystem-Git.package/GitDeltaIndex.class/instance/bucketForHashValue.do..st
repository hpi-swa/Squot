enumerating
bucketForHashValue: aNumber do: aBlock
	| index bucket nextBucket |
	index := aNumber bitAnd: self hashMask.
	bucket := self entryIndexHashMap at: index + 1.
	nextBucket := self entryIndexHashMap at: index + 2.
	self entries from: bucket to: nextBucket - 1 do: aBlock.