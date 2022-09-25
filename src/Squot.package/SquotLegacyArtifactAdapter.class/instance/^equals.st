comparing
= anArtifact
	(anArtifact isKindOf: self class) ifTrue: [^ artifact = anArtifact artifact].
	^ artifact = anArtifact