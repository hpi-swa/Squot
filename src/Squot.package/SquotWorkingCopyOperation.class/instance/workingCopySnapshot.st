accessing
workingCopySnapshot

	^ workingCopySnapshot ifNil: [workingCopySnapshot :=
		SquotToggles useNewApi
			ifTrue: [SquotProjectSnapshot fromStore: workingCopy]
			ifFalse: [workingCopy lazySnapshot]]