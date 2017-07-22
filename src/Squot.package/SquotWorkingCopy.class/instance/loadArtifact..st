loading and unloading
loadArtifact: anArtifact
	"Load a single artifact, replacing the currently loaded one."
	| diff patch |
	diff := self diffObjectAt: anArtifact path against: anArtifact.
	patch := SquotPatch with: {anArtifact path -> diff}.
	store applyPatch: patch