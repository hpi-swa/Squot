loading and unloading
loadArtifactInteractively: anArtifact ifCanceled: cancelBlock
	"Load a single artifact, replacing the currently loaded one."
	| patch |
	self addGlobalObjectsToStore: (SquotSnapshot builder add: anArtifact; buildSnapshot).
	patch := self newPatchBuilder
		updateArtifactTo: anArtifact;
		updateRightArtifacts;
		buildPatch.
	^ self loadPatchInteractively: patch ifCanceled: [cancelBlock value]