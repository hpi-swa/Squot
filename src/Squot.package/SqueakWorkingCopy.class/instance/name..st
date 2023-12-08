accessing
name: aString
	self name = aString ifTrue: [^ self].
	self isRegistered ifFalse: [^ self basicName: aString].
	(self class isNameRegistered: aString)
		ifTrue: [^ self error: 'Cannot rename to a name that is already taken.'].
	self
		unregister;
		basicName: aString;
		register.