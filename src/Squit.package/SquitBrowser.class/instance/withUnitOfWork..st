ui
withUnitOfWork: aBlock
	| unitOfWork |
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	^ [(unitOfWork := self projectSelection repository unitOfWork)
		start;
		activateDuring: aBlock]
		ensure: [unitOfWork finish].