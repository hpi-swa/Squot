loading and unloading
cherryPickInteractivelyFromVersion: aVersion withParent: parentVersion ifLoadCanceled: loadCancelingBlock ifSaveCanceled: saveCancelingUnaryBlock
	| merge loadedPatch |
	self addGlobalObjectsToStore: aVersion.
	self withCurrentSnapshot:
	[merge := SquotMerge into: self
		merge: aVersion
		basedOn: (parentVersion ifNil: [SquotSnapshot empty]).
	loadedPatch := self mergeInteractively: merge ifCanceled: [^ loadCancelingBlock value].
	self saveNewVersionFromPatch: loadedPatch
		ifCanceled:
			[^ saveCancelingUnaryBlock value:
				["revert changes"
				loadedPatch artifacts do: [:each | self loadArtifact: (self currentSnapshot artifactAt: each path)]]]].