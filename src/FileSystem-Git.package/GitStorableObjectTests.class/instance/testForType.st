class-tests
testForType
	self assert: (GitStorableObject forType: 'blob') equals: GitBlob.
	self assert: (GitStorableObject forType: 'commit') equals: GitCommit.
	self assert: (GitStorableObject forType: 'tree') equals: GitTree.
	self assert: (GitStorableObject forType: 'tag') equals: GitTag