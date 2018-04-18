patching
applyPatch: aPatch
	self openTableOfContentsDuring:
		[aPatch applyTo: self displayingProgress: 'Writing objects to files']