initialize-release
initialize
	super initialize.
	self version ifNotNil: [self setCurrentVersion].