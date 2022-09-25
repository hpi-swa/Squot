accessing artifacts
includesArtifact: anArtifact
	"Answer whether I have such an artifact in storage. Ideally this does not require to take a snapshot of the objects, compared to readArtifact:."
	self subclassResponsibility.