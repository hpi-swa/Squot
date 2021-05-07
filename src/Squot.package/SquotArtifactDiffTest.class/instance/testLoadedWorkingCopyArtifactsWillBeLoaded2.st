tests
testLoadedWorkingCopyArtifactsWillBeLoaded2
	| snapshot modification |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy objectAt: 'obj') contents: 2.
	modification := snapshot diffAgainst: (workingCopy artifactAt: 'obj').
	self assert: modification willBeLoaded. "so it is not displayed as unloaded in diff explorer"