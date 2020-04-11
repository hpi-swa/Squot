private
withUnitOfWork: aBlock
	| unitOfWork |
	unitOfWork := workingCopy repository unitOfWork.
	^ [unitOfWork activateDuring: [aBlock value]]
		ensure: [unitOfWork finish]