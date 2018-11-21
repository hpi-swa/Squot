copying
adjustedBy: aDiffNode
	^ aDiffNode isActive
		ifTrue: [self rightDiff]
		ifFalse: [self leftDiff]