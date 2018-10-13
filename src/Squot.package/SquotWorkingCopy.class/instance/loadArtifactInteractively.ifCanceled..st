loading and unloading
loadArtifactInteractively: anArtifact ifCanceled: cancelBlock
	"Load a single artifact, replacing the currently loaded one."
	| patch |
	patch := self newPatchBuilder
		updateArtifactTo: anArtifact;
		buildPatch.
	^ self loadPatchInteractively: patch ifCanceled: [cancelBlock value]