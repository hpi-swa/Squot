as yet unclassified
scanFor: aString ifAbsent: aBlock
	| repository |
	repository := MCRepositoryGroup default repositories
		detect: [:each |
			(each isKindOf: MCFilesystemFetchOnlyRepository)
				and: [each projectPath endsWith: '/', aString]]
		ifNone: [^ aBlock value].
	^ self newWithName: aString on: repository