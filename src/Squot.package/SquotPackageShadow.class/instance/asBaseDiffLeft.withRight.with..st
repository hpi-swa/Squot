comparing
asBaseDiffLeft: leftMCSnapshot withRight: packageArtifact with: aDiffBuilder
	^ packageArtifact
		diffWithLeftSnapshot: leftMCSnapshot
		andBase: snapshot
		with: aDiffBuilder