updating
stepWithText: aString
	doneSteps ifNil: [doneSteps := 0].
	SquotGUI updateProgress: doneSteps / totalSteps text: aString.
	doneSteps := doneSteps + 1.