Squot-diff-patching
squotApplyToLoaded: aPackageInfo with: aPatcher
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	^ self squotApplyToLoaded: aPackageInfo "do not need the help of aPatcher"