tests
testUnloadedAppearDisabledInLoads
	| artifactSnapshot patch |
	store add: ValueHolder new at: 'object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	store removeAt: 'object'.
	workingCopy
		addUnloaded: artifactSnapshot;
		saveVersionWithMessage: 'Add object'.
	patch := workingCopy baseVersion patchRelativeToBase: workingCopy.
	self assert: (patch includesDiffAt: 'object');
		assert: (patch diffAt: 'object') isLoad;
		deny: (patch diffAt: 'object') willBeLoaded.
