copying
squotAdjustToResemble: aSquotDiffNode
	| activeNodes remainingConflictNodes operationNodes |
	activeNodes := aSquotDiffNode withAllChildren select: [:each | each isActive].
	remainingConflictNodes := activeNodes select: [:each | each needsChoice].
	operationNodes := activeNodes copyWithoutAll: remainingConflictNodes.
	^ self class
		operations: (operationNodes collect: [:each | each effectiveContent] thenSelect: #notNil)
		conflicts: (remainingConflictNodes collect: [:each | each content])