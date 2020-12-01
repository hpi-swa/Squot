commit tests
testAllegedMerge
	"Create a version with multiple parents, without actually merging the trees"
	| wc2 firstParentHash secondParentHash actualParents |
	self createSomeCommits.
	self withUnitOfWork: [:git |
	wc2 := fsRepository commitNamed: workingCopy parents first revision hexHash.
	wc2 / 'file3' writeStreamDo: [:stream | stream nextPutAll: 'other side'].
	wc2 branch: 'other' message: 'other side commit'.
	firstParentHash := workingCopy revision hexHash.
	
	workingCopy addParent: (secondParentHash := wc2 revision hexHash).
	workingCopy / 'file3' writeStreamDo: [:stream | stream nextPutAll: 'pretended merge'].
	workingCopy commit: 'merge commit'.
	self assert: 2 equals: (actualParents := workingCopy revision parents) size.
	self assert: firstParentHash equals: actualParents first hexHash.
	self assert: secondParentHash equals: actualParents second hexHash.
	].