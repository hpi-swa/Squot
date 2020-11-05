loading and unloading
loadVersionInteractively: aVersion ifCanceled: cancelBlock
	"Let the user choose artifact editions to load from aVersion.
	Answer true if the load was accepted, false if it was canceled."
	| patch |
	self addGlobalObjectsToStore: aVersion lazySnapshot.
	patch := (aVersion patchRelativeToBase: self) createNewBuilder.
	(((unloadedArtifacts select: [:each | each isLoadable])
		reject: [:each | patch includesDiffAt: each path])
		collect: [:each | self artifactAt: each path])
		do: [:each | | load |
			load := SquotArtifactLoad of: each.
			patch addDiff: load.
			load toggleWhetherToLoad].
	patch := patch buildPatch.
	self loadPatchInteractively: patch ifCanceled: [^ cancelBlock value].
	patch hasChanges ifTrue:
		[self loadedVersion: aVersion].