converting
convertDiffOf: aShadow
	^ aShadow hasSquotShadowName
		ifTrue: [(graphDiff diffForObjectNamed: aShadow name
					ifAbsent: ["assume the object has been added" ^ #()])
				asSquotHierarchicalDiffWith: self]
		ifFalse: ["assume the object has been added" #()]