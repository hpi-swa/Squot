Squot-diff-patching
squotApplyTo: aShadow with: aPatcher
	choice ifNil: [self error: 'Conflict must be resolved first'].
	^ self instVarNamed: choice