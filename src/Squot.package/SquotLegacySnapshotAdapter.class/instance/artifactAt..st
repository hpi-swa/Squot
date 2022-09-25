accessing
artifactAt: aString
	| artifact |
	(snapshot project includesArtifactWithId: aString) ifTrue: [^ snapshot project artifactAt: aString "actually UUID"].
	artifact := snapshot project artifacts detect: [:each | each path = aString] ifNone: [(KeyNotFound key: aString) signal].
	^ SquotLegacyArtifactAdapter newFrom: (snapshot snapshotArtifact: artifact)