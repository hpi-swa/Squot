loading and unloading
loadArtifactInteractively: anArtifact ifCanceled: cancelBlock
	"Load a single artifact, replacing the currently loaded one."
	| patch |
	self addGlobalObjectsToStore: (SquotSnapshot builder add: anArtifact; buildSnapshot).
	patch := self newPatchBuilder
		updateArtifactTo: anArtifact.
	(patch hasChanges not and: [(self artifactAt: anArtifact path) isLoaded not and: [anArtifact isLoadable]])
		ifTrue: [| load |
			load := SquotArtifactLoad of: (self artifactAt: anArtifact path).
			patch addDiff: load.
			load toggleWhetherToLoad].
	patch := patch buildPatch.
	^ self loadPatchInteractively: patch ifCanceled: [cancelBlock value]