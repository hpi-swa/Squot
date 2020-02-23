loading
loadParents
	| unitOfWork |
	GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [unitOfWork := self repository unitOfWork]
		ifFalse: [unitOfWork := self repository].
	^ self basicParents collect: [ :parentHash |
		unitOfWork objectNamed: parentHash ]