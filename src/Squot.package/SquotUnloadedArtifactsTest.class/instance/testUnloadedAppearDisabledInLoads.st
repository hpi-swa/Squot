tests
testUnloadedAppearDisabledInLoads
	| artifactSnapshot patch |
	store add: ValueHolder new at: 'object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	store removeAt: 'object'.
	workingCopy
		addUnloaded: artifactSnapshot;
		saveVersionWithMessage: 'Add object'.
	patch := workingCopy baseVersion snapshot patchRelativeToBase:
		(SquotToggles useNewApi
			ifTrue: [SquotProjectSnapshot fromStore: workingCopy]
			ifFalse: [workingCopy]).
	SquotToggles useNewApi
		ifTrue:
			["Unloaded objects are no longer treated specially on this level."
			self deny: (patch includesMergeAt: artifactSnapshot artifact id);
				assert: ((workingCopy storeForArtifact: artifactSnapshot artifact) isKindOf: SquotSnapshotStore).
			self flag: #todo. "Test that load tool produces a node to load the artifact?"]
		ifFalse:
			[self assert: (patch includesDiffAt: 'object');
				assert: (patch diffAt: 'object') isLoad;
				deny: (patch diffAt: 'object') willBeLoaded].
