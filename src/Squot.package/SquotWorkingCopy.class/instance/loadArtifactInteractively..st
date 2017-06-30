loading and unloading
loadArtifactInteractively: anArtifact
	"Load a single artifact, replacing the currently loaded one."
	| snapshot |
	self withCurrentSnapshot:
	[snapshot := self currentSnapshot createNewBuilder
		add: anArtifact;
		buildSnapshot.
	^ self loadSnapshotInteractively: snapshot]