merging
mergeWithoutBaseWith: anArtifactOrMock
	^ (mergeBlock ifNil: [self defaultMergeBlock]) cull: anArtifactOrMock cull: self