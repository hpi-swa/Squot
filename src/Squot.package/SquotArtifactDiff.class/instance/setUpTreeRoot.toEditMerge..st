*Squot-Tools
setUpTreeRoot: aDiffNode toEditMerge: aProjectMerge
	SquotToggles useNewApi
		ifTrue: [self subclassResponsibility]
		ifFalse:
			[aDiffNode
				includeBlock: [aProjectMerge containerModifications at: aDiffNode content path put: aDiffNode content];
				excludeBlock: [aProjectMerge containerModifications removeKey: aDiffNode content path]]