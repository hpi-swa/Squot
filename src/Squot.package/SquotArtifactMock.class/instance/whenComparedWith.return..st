configuring
whenComparedWith: otherArtifactOrMock return: aBlock
	| previousBlock |
	previousBlock := diffBlock ifNil: [[:other :this | self error: 'Mock not configured for diff']].
	diffBlock :=
		[:other :this |
		other = otherArtifactOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].