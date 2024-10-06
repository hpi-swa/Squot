accessing
name: aString ifTaken: aBlock
	self name = aString ifTrue: [^ self].
	self isRegistered ifFalse: [^ self basicName: aString].
	(self class isNameRegistered: aString) ifTrue: [^ aBlock value].
	self
		unregister;
		basicName: aString;
		register.