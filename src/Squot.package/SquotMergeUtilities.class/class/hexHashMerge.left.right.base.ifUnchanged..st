merging
hexHashMerge: hexHashBlock
left: leftFSCommit
right: rightFSCommit
base: baseFSCommit
ifUnchanged: unchangedBlock
	self
		atomicMergeLeft: (hexHashBlock value: leftFSCommit)
		right: (hexHashBlock value: rightFSCommit)
		base: (hexHashBlock value: baseFSCommit)
		ifUnchanged: unchangedBlock
		ifMerged: [:merged |]
		ifConflict: [:conflict |].