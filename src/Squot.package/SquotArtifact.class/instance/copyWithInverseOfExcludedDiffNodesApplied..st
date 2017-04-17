copying
copyWithInverseOfExcludedDiffNodesApplied: aDiffNode
	^ self copyWithDifferentContent:
		(content squotApplyInverseOfExcludedDiffNodes: aDiffNode)