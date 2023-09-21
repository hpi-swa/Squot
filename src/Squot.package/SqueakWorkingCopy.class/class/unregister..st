registering
unregister: aWorkingCopy
	(self isRegistered: aWorkingCopy) ifFalse: [^ self].
	self registry removeKey: aWorkingCopy name.
	self changed: #registry.