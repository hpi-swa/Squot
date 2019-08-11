configuring
whenMergeWith: otherArtifactOrMock return: aBlock
	| previousBlock |
	previousBlock := mergeBlock ifNil: [[:other :this | self error: 'Mock not configured for merge']].
	mergeBlock :=
		[:other :this |
		other = otherArtifactOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock value: other value: this]].