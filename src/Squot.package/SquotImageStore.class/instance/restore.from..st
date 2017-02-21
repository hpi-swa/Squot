private
restore: anObject from: anArtifact
	(self loaderFor: anArtifact) load: anArtifact replacing: anObject.