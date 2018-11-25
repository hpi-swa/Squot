applying
applyToContainer: anObjectContainer

	(anObjectContainer class canUnderstand: #directory)
		ifTrue: [self target: anObjectContainer directory].
	self diffs do: [:each | each applyWith: self].