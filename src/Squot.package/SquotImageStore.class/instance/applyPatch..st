patching
applyPatch: aPatch
	aPatch applyTo: self displayingProgress: [:each | 'Updating objects... ', each].
	self loadOrder removeAllSuchThat: [:each | (objects includesKey: each) not].