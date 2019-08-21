accessing
right
	^ right ifNil: [right := self createArtifactMock]