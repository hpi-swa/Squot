*Squot-Mapper-Assets
squotDirectoryForProjectNamed: aString
	| reference |
	reference := SquotPathUtilities ancestorOf: self directory asFSReference that: [:ancestor |
		SquotMappersMapper new hasMappersFile: (SquotSubFileSystem onReference: ancestor)].
	^ (reference ifNil: [^ nil]) basename = aString
		ifTrue: [reference]
		ifFalse: [nil]