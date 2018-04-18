patching
mergeWithDiff: anArtifactDiff
	"The other side changed an artifact that was removed on my side. This is a conflict."
	"Inverse case is in SquotArtifactDiff>>#mergeWithRemoval:"
	"double dispatch, initiated by #mergeWith:"
	^ anArtifactDiff inConflictWith: self