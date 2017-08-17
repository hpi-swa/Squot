adding and removing
add: anArtifact
	self store: anArtifact.
	self addToTableOfContents: anArtifact.
	^ anArtifact