merging
mergeWith: anArtifactDiffOrMock
	^ (mergeBlock ifNil: [self defaultMergeBlock]) cull: anArtifactDiffOrMock cull: self