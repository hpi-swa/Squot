testing
hasActiveChildren
	^ children anySatisfy: [:each | each isActive]