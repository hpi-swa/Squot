ui
accept
	(artifactDiffs anySatisfy: [:any | any needsChoice])
		ifTrue: [^ self inform: 'Some conflicts must still be resolved.'].
	canceled := false.
	self changed: #close.