instance creation
activeFor: aSquitRepository ifNone: aBlock
	| unitOfWork |
	GitFeatureFlags useUnitOfWorkInterface ifFalse:
		[^ self fallbackForRepository: aSquitRepository gitRepository for: aSquitRepository].
	unitOfWork := GitCurrentUnitOfWork forRepository: aSquitRepository.
	unitOfWork ifNil: [^ aBlock value].
	^ self wrapping: unitOfWork for: aSquitRepository