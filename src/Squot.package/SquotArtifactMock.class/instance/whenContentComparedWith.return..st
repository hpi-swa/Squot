configuring
whenContentComparedWith: otherArtifactOrMock return: aBlock
	| previousBlock |
	previousBlock := diffContentBlock ifNil: [[:other :this | self error: 'Mock not configured for diff']].
	diffContentBlock :=
		[:other :this |
		other = otherArtifactOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].