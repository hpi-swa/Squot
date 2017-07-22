private
restore: anObject from: anArtifact
	^ (self materializerFor: anArtifact) materialize: anArtifact replacing: anObject.