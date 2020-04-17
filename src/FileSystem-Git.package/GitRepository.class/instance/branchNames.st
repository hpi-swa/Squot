public-accessing-objects
branchNames
	| looseBranchNames packedRefs packedBranchNames |
	self privateDeprecatedUseUnitOfWork.
	looseBranchNames := #().
	self headsDir exists ifTrue:
		[looseBranchNames := self headsDir allFiles
			collect: [:each | self refFromFile: each relativeTo: self headsDir]].
	packedRefs := self packedRefs.
	packedBranchNames := ((packedRefs
		select: [:each | each name beginsWith: 'refs/heads/'])
		collect: [:each | each name allButFirst: 'refs/heads/' size])
		difference: looseBranchNames.
	^ looseBranchNames, packedBranchNames