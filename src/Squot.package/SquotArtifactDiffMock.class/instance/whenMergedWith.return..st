configuring
whenMergedWith: otherArtifactDiffOrMock return: aBlock
	| previousBlock |
	previousBlock := mergeBlock ifNil: [self defaultMergeBlock].
	mergeBlock :=
		[:other :this |
		other = otherArtifactDiffOrMock
			ifTrue: [aBlock value]
			ifFalse: [previousBlock cull: other cull: this]].