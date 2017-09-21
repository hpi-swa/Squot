accessing
className
	^ (snapshot definitions detect: [:each | each isClassDefinition]) className