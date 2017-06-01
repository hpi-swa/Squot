loading
squotApplyToLoaded: aPackageInfo
	conflicts ifNotEmpty: [self error: 'Conflicts must be resolved first'].
	^ (MCPatch operations: operations) squotApplyToLoaded: aPackageInfo