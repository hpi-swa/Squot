registering
unregister: aWorkingCopy
	(self isRegistered: aWorkingCopy) ifFalse: [^ self].
	self registry removeKey: name.
	self changed: #registry.