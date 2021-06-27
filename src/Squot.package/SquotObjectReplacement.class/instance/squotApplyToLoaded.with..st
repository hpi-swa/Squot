patching
squotApplyToLoaded: anObject with: aPatcher
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	^ aPatcher rematerialize: right