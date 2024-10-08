checks
checkIsMessageEmpty
	self isMessageEmpty ifFalse: [^ false].
	self inform: 'Empty message, aborting.'.
	^ true