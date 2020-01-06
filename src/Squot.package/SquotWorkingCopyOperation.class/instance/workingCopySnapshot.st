accessing
workingCopySnapshot

	^ workingCopySnapshot ifNil: [workingCopySnapshot := workingCopy lazySnapshot]