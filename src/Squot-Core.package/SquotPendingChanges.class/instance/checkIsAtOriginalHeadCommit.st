checks
checkIsAtOriginalHeadCommit
	self isAtOriginalHeadCommit ifTrue: [^ true].
	self inform: 'These changes are outdated. Aborting.'.
	^ false