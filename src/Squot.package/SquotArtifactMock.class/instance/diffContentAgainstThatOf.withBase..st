mocking
diffContentAgainstThatOf: incomingArtifactOrMock withBase: baseArtifactOrMock
	^ mergeContentBlock cull: incomingArtifactOrMock cull: self cull: baseArtifactOrMock