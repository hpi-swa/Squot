private
logChangeStartIfNotDoneAlready
	hasLoggedStart ifTrue: [^ self].
	Smalltalk logChange: '---- vvv following changes created by tests vvv'.
	hasLoggedStart := true.