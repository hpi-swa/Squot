verifying
verifyPackedObjectsDo
	| pack index codes |
	pack := GitPackFile on: packFile in: repository.
	index := 1.
	codes := #('commit' 'commit' 'commit' 'tree' 'blob' 'tree' 'blob' 'tree' 'blob').
	pack packedObjectsDo: [ :packedObject |
		self assert: (packedObject object typeCode = (codes at: index)).
		index := index + 1 ]