tests
testInitialTrackedFilesArtifact

	self assert:
		(self workingCopy currentSnapshot artifacts anySatisfy: [:each | each isKindOf: SquotLiveFilesArtifact]).