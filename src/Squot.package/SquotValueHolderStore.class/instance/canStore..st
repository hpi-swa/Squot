testing
canStore: anArtifact
	"I can store only a single artifact, but I can store any kind of object."
	^ artifact isNil or: [artifact id = anArtifact id]