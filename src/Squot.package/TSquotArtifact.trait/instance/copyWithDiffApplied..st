copying
copyWithDiffApplied: aDiffNode
	^ self copyWithDifferentContent: (self content squotApplyDiffNode: aDiffNode)