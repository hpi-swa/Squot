private
logChangeEnd
	hasLoggedStart ifFalse: [^ self].
	Smalltalk logChange: '---- ^^^ previous changes were created by tests ^^^'.