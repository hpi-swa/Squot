*GitS-Core-Asset
gitSDirectoryForProjectNamed: aString
	| reference |
	reference := GSPathUtilities ancestorOf: self directory asFSReference that: [:ancestor |
		GSMetadataMapper new hasAnyFile: (GSSubFileSystem onReference: ancestor)].
	^ (reference ifNil: [^ nil]) basename = aString
		ifTrue: [reference]
		ifFalse: [nil]