applying
withUnitOfWork: aBlock
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	unitOfWork ifNil: [unitOfWork := workingCopy repository unitOfWork].
	unitOfWork == workingCopy repository ifTrue: [^ aBlock value].
	^ unitOfWork activateDuring: aBlock