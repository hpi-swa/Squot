tests
testInitialTrackedFilesArtifact

	self assert:
		(self workingCopy artifacts anySatisfy: [:each | each isKindOf: LBGitLiveFilesArtifact]).