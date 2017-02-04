utilities
logChangeStartIfNotDoneAlready
	self hasChangeStartLogged ifTrue: [^ self].
	Smalltalk logChange: '---- vvv following changes created by tests vvv'.
	self rememberChangeStartWasLogged.