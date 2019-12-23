*Squot-Tools
setUpTreeRoot: aDiffNode toEditMerge: aMerge
	aDiffNode
		includeBlock: [aMerge containerModifications at: aDiffNode content path put: aDiffNode content];
		excludeBlock: [aMerge containerModifications removeKey: aDiffNode content path].