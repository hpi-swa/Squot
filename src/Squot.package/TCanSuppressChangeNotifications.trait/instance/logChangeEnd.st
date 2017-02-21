utilities
logChangeEnd
	self hasChangeStartLogged ifFalse: [^ self].
	Smalltalk logChange: '---- ^^^ previous changes were created by tests ^^^'.
	self resetChangeStartLogged.