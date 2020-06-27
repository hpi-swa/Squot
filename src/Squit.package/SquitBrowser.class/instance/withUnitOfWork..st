ui
withUnitOfWork: aBlock
	| unitOfWork |
	SquotToggles useUnitOfWorkInterface ifFalse: [^ aBlock value].
	self hasProjectSelection ifFalse: [^ aBlock value].
	unitOfWork := self projectSelection repository unitOfWork.
	unitOfWork start.
	^ [unitOfWork activateDuring: aBlock]
		ensure: [unitOfWork finish]