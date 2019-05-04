loading and unloading
cherryPickInteractivelyFromVersion: aVersion withParent: parentVersion ifLoadCanceled: loadCancelingBlock ifSaveCanceled: saveCancelingUnaryBlock
	| patch loadedPatch |
	self addGlobalObjectsToStore: aVersion.
	self withCurrentSnapshot:
	[patch := SquotMergePatchBuilder new patchFrom: self to: aVersion base: parentVersion.
	loadedPatch := self loadPatchInteractively: patch ifCanceled: [^ loadCancelingBlock value].
	self saveNewVersionFromPatch: loadedPatch
		ifCanceled:
			[^ saveCancelingUnaryBlock value:
				["revert changes"
				loadedPatch artifacts do: [:each | self loadArtifact: (self currentSnapshot artifactAt: each path)]]]].