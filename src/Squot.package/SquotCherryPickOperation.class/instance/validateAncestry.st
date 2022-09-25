applying
validateAncestry
	pickedVersion ifNil: [self error: 'Version to pick not configured'].
	relevantParentOfPickedVersion ifNil:
		[pickedVersion parents isEmpty
			ifTrue: [relevantParentOfPickedVersion := self nullBase]
			ifFalse: [self error: 'Parent of version to pick not configured']].