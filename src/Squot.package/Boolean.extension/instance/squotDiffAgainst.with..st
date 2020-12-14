*Squot-shadow-comparing
squotDiffAgainst: aBoolean with: aSquotDiffBuilder
	^ aBoolean = self
		ifTrue: [SquotDiffOfEqualObjects instance]
		ifFalse: [SquotObjectReplacement left: self right: aBoolean]