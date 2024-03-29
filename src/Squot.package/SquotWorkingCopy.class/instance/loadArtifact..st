loading and unloading
loadArtifact: anArtifact
	"Load a single artifact, replacing the currently loaded one."
	| patch |
	patch := self newPatchBuilder
		updateArtifactTo: anArtifact;
		updateRightArtifacts;
		buildPatch.
	self applyPatch: patch