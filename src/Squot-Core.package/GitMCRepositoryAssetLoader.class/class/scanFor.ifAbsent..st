as yet unclassified
scanFor: aString ifAbsent: aBlock
	| repository |
	repository := MCRepositoryGroup default repositories
		detect: [:each | (each squotDirectoryForProjectNamed: aString) notNil]
		ifNone: [^ aBlock value].
	^ self newWithName: aString on: repository