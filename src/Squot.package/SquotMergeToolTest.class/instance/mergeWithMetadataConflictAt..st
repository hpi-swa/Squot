test objects
mergeWithMetadataConflictAt: path
	| baseArtifact workingArtifact incomingArtifact |
	baseArtifact := SquotArtifact new path: path;
		storeInfo:
			(SquotTrackedObjectMetadata newFrom: {#contested -> 'base'. #old -> ''. #update -> 'original'});
		content: SquotArtifactContentMock new whenComparedReturnMock.
	workingArtifact := SquotArtifact new path: path;
		storeInfo:
			(SquotTrackedObjectMetadata newFrom: {#foo -> 'bar'. #contested -> 'working'. #old -> ''. #update -> 'original'});
		content: SquotArtifactContentMock new whenComparedReturnMock.
	incomingArtifact := SquotArtifact new path: path;
		storeInfo:
			(SquotTrackedObjectMetadata newFrom: {#foo -> 'bla'. #contested -> 'incoming'. #new -> ''. #update -> 'changed'});
		content: SquotArtifactContentMock new whenComparedReturnMock.
	workingArtifact content whenMergedReturn: (SquotMergeMock new working: workingArtifact content; incoming: incomingArtifact content; yourself).
	^ SquotMerge
		into: (SquotSnapshot builder add: workingArtifact; buildSnapshot)
		merge: (SquotSnapshot builder add: incomingArtifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: baseArtifact; buildSnapshot)