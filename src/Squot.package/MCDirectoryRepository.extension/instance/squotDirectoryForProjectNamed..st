*Squot-Mapper-Assets
squotDirectoryForProjectNamed: aString
	| reference |
	reference := SquotPathUtilities ancestorOf: self directory asFSReference that: [:ancestor |
		(SquotPathUtilities resolve: SquotMappersMapper path withRootAt: ancestor) exists].
	^ (reference ifNil: [^ nil]) basename = aString
		ifTrue: [reference]
		ifFalse: [nil]