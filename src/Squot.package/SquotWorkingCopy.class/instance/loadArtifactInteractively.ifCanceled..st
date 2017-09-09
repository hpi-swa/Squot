loading and unloading
loadArtifactInteractively: anArtifact ifCanceled: cancelBlock
	"Load a single artifact, replacing the currently loaded one."
	| diff patch |
	diff := self diffObjectAt: anArtifact path against: anArtifact.
	patch := SquotPatch with: (Dictionary newFrom: {anArtifact path -> diff}).
	^ self loadPatchInteractively: patch ifCanceled: [cancelBlock value]