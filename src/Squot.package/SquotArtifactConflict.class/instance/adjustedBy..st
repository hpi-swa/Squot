copying
adjustedBy: aDiffNode
	^ aDiffNode children first isActive
		ifTrue: [self rightDiff]
		ifFalse: [self leftDiff]