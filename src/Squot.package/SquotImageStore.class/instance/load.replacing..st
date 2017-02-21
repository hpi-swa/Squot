private loading
load: anArtifact replacing: anObject
	"double dispatch"
	^ anArtifact loadWith: self replacing: anObject