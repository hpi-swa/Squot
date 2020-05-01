testing
refExists: fullRef
	(refs at: fullRef ifAbsent: [#notLookedUp])
		ifNil: [^ false]
		ifNotNil: [:ref | ref ~~ #notLookedUp ifTrue: [^ true]].
	^ refStores anySatisfy: [:each | each includes: fullRef]