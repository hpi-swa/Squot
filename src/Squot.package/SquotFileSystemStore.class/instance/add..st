adding and removing
add: anArtifact
	self store: anArtifact.
	self shouldStoreMetadata ifTrue:
		[self tableOfContents
			add: anArtifact;
			fileOut].
	^ anArtifact