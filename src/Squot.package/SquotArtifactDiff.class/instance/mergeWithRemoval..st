patching
mergeWithRemoval: anArtifactRemoval
	"The other side changed an artifact that was removed on my side. This is a conflict."
	"Inverse case is in SquotArtifactRemoval>>#mergeWithDiff:"
	"double dispatch, initiated by #mergeWith:"
	^ anArtifactRemoval inConflictWith: self