patching
squotApplyToLoaded: aDictionary with: aPatcher
	super squotApplyToLoaded: aDictionary with: aPatcher.
	itemChanges associationsDo: [:each |
		each squotApplyToLoaded: aDictionary with: aPatcher].
	^ aDictionary