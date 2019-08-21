merging
resolvedPatch
	self flag: #stub.
	^ self class new
		packageName: packageName
		patch: patch resolvedPatch