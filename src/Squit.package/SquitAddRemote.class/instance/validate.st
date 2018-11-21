validating
validate
	self validateUrl ifFalse: [^ false].
	self validateRemoteName ifFalse: [^ false].
	^ true