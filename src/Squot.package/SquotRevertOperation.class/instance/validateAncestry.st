applying
validateAncestry
	revertedVersion ifNil: [self error: 'Version to revert not configured'].
	relevantParentOfRevertedVersion ifNil:
		[revertedVersion parents isEmpty
			ifTrue: [relevantParentOfRevertedVersion := SquotSnapshot empty]
			ifFalse: [self error: 'Parent of version to revert not configured']].