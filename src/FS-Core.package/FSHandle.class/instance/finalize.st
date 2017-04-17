as yet unclassified
finalize
	self isOpen ifTrue: [self close].
	super finalize.