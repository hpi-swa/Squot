configuring
whenContentMergedWith: otherArtifactOrMock return: aBlock
	| previousBlock |
	previousBlock := mergeContentBlock ifNil: [[:other :this | self error: 'Mock not configured for merge']].
	mergeContentBlock :=
		[:other :this |
		other = otherArtifactOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].