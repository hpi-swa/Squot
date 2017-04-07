private materializing
materialize: anArtifact replacing: anObject
	"double dispatch"
	^ anArtifact materializeWith: self replacing: anObject