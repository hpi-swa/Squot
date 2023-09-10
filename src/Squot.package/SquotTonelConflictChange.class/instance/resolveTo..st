resolving
resolveTo: aDefinition
	self isResolved: true.
	self resolution: aDefinition.
	self isInEditMode: false.