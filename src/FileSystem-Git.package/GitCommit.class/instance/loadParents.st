loading
loadParents
	| unitOfWork |
	unitOfWork := self repository unitOfWork.
	^ self basicParents collect: [ :parentHash |
		unitOfWork objectNamed: parentHash ]