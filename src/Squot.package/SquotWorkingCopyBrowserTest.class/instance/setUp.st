running
setUp
	workingCopy := (SquotToggles useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]) forTestInMemory.
	browser := SquotWorkingCopyBrowser newOn: workingCopy.