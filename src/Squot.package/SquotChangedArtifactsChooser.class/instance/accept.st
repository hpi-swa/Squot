actions
accept
	(rootNodes anySatisfy: [:any | any anyChildNeedsChoice])
		ifTrue: [^ self inform: 'Some conflicts must still be resolved.'].
	canceled := false.
	self changed: #close.