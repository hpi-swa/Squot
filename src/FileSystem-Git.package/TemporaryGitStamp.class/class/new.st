instance creation
new
	thisContext sender receiver ~~ self
		ifTrue: [self warn: 'You should use #ensureDefaultValues to create an instance of TemporaryGitStamp'].
	^ super new