converting
convertDiffOf: aShadow
	^ aShadow hasSquotShadowName
		ifTrue: [self convertToNodes:
				(graphDiff diffForObjectNamed: aShadow name
					ifAbsent: ["assume the object has been added" ^ #()])]
		ifFalse: ["assume the object has been added" #()]