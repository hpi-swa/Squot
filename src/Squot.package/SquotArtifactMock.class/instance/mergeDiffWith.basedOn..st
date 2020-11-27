merging
mergeDiffWith: otherArtifactOrMock basedOn: baseArtifactOrMock
	^ (mergeBlock ifNil: [self defaultMergeBlock]) cull: otherArtifactOrMock cull: self cull: baseArtifactOrMock