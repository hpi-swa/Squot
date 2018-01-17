visiting
visitDiffNode: aDiffNode
	aDiffNode needsChoice
		ifTrue: [nodeThatNeedsChoice := aDiffNode]
		ifFalse: [self enqueueAll: aDiffNode children].