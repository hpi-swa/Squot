loading and unloading
loadArtifactInteractively: anArtifact ifCanceled: cancelBlock
	"Load a single artifact, replacing the currently loaded one."
	| diff patch |
	diff := (self artifactAt: anArtifact path ifAbsent: [anArtifact absentCopy])
		diffAgainst: anArtifact.
	patch := SquotPatch with: {diff}.
	^ self loadPatchInteractively: patch ifCanceled: [cancelBlock value]