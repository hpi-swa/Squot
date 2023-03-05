*Squot-FileSystemStore
stonOn: aStonWriter
	"Convert all dictionaries to ordered dictionaries to make the output order stable."
	| walk |
	walk := SquotGraphWalk startingFrom: (SquotObjectReflection object: self mirror: self class squotMirror).
	walk do:
		[:eachReflection |
		(eachReflection object isDictionary and: [(eachReflection object isKindOf: OrderedDictionary) not and: [(eachReflection object isKindOf: SquotTrackedObjectMetadata) not]])
			ifTrue:
				[walk currentReferrer mirror
					reflect: walk currentPath last
					of: walk currentReferrer object
					put: (OrderedDictionary newFrom: eachReflection object).
				walk
					add: (walk currentReferrer nextReflection: walk currentPath last) 
					path: walk currentPath]
			ifFalse:
				[eachReflection references do:
					[:eachReference | | next |
					next := eachReflection nextReflection: eachReference.
					next object isString | next object isNumber
						"this condition is just an optmization"
						ifFalse: [walk add: next reachedVia: eachReference]]]].
	^ super stonOn: aStonWriter