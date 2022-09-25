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
			[self assert: (patch includesMergeAt: artifactSnapshot artifact id);
				deny: (patch mergeAt: artifactSnapshot artifact id) hasChanges;
				assert: ((workingCopy storeForArtifact: artifactSnapshot artifact) isKindOf: SquotSnapshotStore)]
		ifFalse:
			[self assert: (patch includesDiffAt: 'object');
				assert: (patch diffAt: 'object') isLoad;
				deny: (patch diffAt: 'object') willBeLoaded].
