adding and removing
addMerge: aMerge
	self assert: aMerge hasChanges description: 'should not add merges without changes'.
	elementMerges at: (self keyOf: aMerge object) put: aMerge.