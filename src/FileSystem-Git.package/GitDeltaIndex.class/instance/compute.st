computing
compute
	| hashSize hashedLinkedLists entryIndex |
	self entries: self source size - 1 // GitDeltaRabinHasher window.
	self source size >= 16rffffffff ifTrue: [self entries: 16rffffffff // GitDeltaRabinHasher window].
	hashSize := self entries // 4 asSmallerPowerOfTwo clampLow: 16.
	self hashMask: hashSize - 1.
	hashedLinkedLists := self computeHashedLinkedLists.
	self entries: (Array new: self entries).
	self entryIndexHashMap: (Array new: hashSize + 1).
	entryIndex := 1.
	hashedLinkedLists doWithIndex: [:list :bucketIndex |
		self entryIndexHashMap at: bucketIndex put: entryIndex.
		list ifNotNil: [list do: [:entry |
			self entries at: entryIndex put: entry.
			entryIndex := entryIndex + 1]]].
	"the last hash map entry contains one-past-the-last-entry to allow for iteration between two buckets"
	self entryIndexHashMap at: self entryIndexHashMap size put: entryIndex.