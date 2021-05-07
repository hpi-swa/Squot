private
withUnitOfWork: aBlock
	| unitOfWork |
	unitOfWork := workingCopy repository unitOfWork.
	^ [unitOfWork
		start;
		activateDuring: [aBlock value]]
		ensure: [unitOfWork finish]