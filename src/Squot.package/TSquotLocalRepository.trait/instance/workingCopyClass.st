Squot repository
workingCopyClass
	^ SquotToggles useNewApi ifTrue: [SquotWorkingCopy2] ifFalse: [SquotWorkingCopy]