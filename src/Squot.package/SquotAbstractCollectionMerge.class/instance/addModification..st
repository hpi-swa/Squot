adding and removing
addModification: aModification
	self assert: (aModification isAddition or: [aModification isRemoval or: [aModification isLoad]])
		description: 'Elements should be merged, not only modified'.
	containerModifications at: (self keyOf: aModification object) put: aModification.