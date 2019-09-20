merging
resolvedPatch
	self flag: #stub. "should have a PackageMerge class"
	^ self class new
		packageName: packageName
		patch: patch resolvedPatch