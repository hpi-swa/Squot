updating
stepWithText: aString
	doneSteps ifNil: [doneSteps := 0].
	self update: doneSteps / totalSteps text: aString.
	doneSteps := doneSteps + 1.