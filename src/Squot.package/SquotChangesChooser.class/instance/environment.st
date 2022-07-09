Smalltalk tools
environment
	| workingCopyArtifact |
	self selectedNode ifNil: [^ super environment].
	workingCopyArtifact := self workingCopy artifactAt: self selectedNode artifactDiff path ifAbsent: [^ super environment].
	workingCopyArtifact isLoaded ifFalse: [^ super environment].
	^ PackageInfo squotEnvironmentOf: workingCopyArtifact