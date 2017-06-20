patching
squotApplyTo: aMCSnapshot with: aDiffBuilder
	conflicts ifNotEmpty: [self error: 'Conflicts must be resolved first!'].
	^ MCPatcher apply: (MCPatch operations: operations) to: aMCSnapshot