Squot-merge-testing
hasChanges
	self flag: #stub. "should have a PackageMerge class"
	^ patch squotHasConflicts or: [self squotHasChanges]