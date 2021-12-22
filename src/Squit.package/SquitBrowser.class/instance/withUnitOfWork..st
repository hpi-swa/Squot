ui
withUnitOfWork: aBlock
	| unitOfWork |
	self hasProjectSelection ifFalse: [^ nil "no repository, do nothing" ].
	unitOfWork := self projectSelection repository unitOfWork.
	unitOfWork start.
	^ [unitOfWork activateDuring: aBlock]
		ensure: [unitOfWork finish]