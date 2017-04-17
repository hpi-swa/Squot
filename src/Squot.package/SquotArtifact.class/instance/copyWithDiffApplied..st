copying
copyWithDiffApplied: aDiffNode
	^ self copyWithDifferentContent: (content squotApplyDiffNode: aDiffNode)