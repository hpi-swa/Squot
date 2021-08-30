as yet unclassified
withUnitOfWork: aBlock

	| unitOfWork |
	self hasSelectedRepository ifFalse: [^ aBlock value].
	
	unitOfWork := self selectedRepository repository unitOfWork.
	unitOfWork start.
	^ [unitOfWork activateDuring: aBlock]
		ensure: [unitOfWork finish]