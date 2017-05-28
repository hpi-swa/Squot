copying
copyWithInverseOfExcludedDiffNodesApplied: aDiffNode
	^ self copyWithDifferentContent:
		(self content squotApplyInverseOfExcludedDiffNodes: aDiffNode)