mocking
diffContentAgainstThatOf: incomingArtifactOrMock withBase: baseArtifactOrMock
	^ diffContentBlock cull: incomingArtifactOrMock cull: self cull: baseArtifactOrMock