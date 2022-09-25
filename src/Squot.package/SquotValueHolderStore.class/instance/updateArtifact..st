accessing artifacts
updateArtifact: anArtifactMerge
	| oldArtifact |
	self flag: #todo. "Refactor patcher to start from the holder contents reference, not from its value."
	anArtifactMerge hasChanges ifFalse: [^ self].
	oldArtifact := artifact. "Just to be able to restore it when debugging this method."
	artifact := anArtifactMerge result artifact.
	^ SquotActiveObjectRegistry value: self objectRegistry during:
		[| graph |
		SquotCurrentMetadata value: anArtifactMerge working artifact storeInfo during:
			[graph := SquotObjectCapturer new
				registry: self objectRegistry;
				captureGraph: holder contents;
				objectGraph].
		SquotCurrentMetadata value: anArtifactMerge result artifact storeInfo during:
			[SquotPatcher new
				registry: self objectRegistry;
				apply: anArtifactMerge resolvedPatch content toLoadedGraph: graph.
			holder contents: graph startObject].
		self flag: #todo. "Determine suitable answer"]