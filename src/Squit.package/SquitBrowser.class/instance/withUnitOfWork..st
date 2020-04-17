ui
withUnitOfWork: aBlock
	| unitOfWork |
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	^ [(unitOfWork := self projectSelection repository unitOfWork)
		activateDuring: aBlock]
		ensure: [unitOfWork finish].