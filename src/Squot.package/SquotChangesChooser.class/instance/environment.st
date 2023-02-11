Smalltalk tools
environment
	| workingCopyArtifact |
	self selectedNode ifNil: [^ super environment].
	SquotToggles useNewApi
		ifTrue:
			[| store |
			store := self workingCopy storeForArtifact: self selectedNode artifactDiff working artifact.
			(store hasLoaded: self selectedNode artifactDiff working artifact) ifFalse: [^ super environment].
			(store respondsTo: #environment) ifTrue: [^ store environment].
			^ super environment]
		ifFalse:
			[workingCopyArtifact := self workingCopy artifactAt: self selectedNode artifactDiff path ifAbsent: [^ super environment].
			workingCopyArtifact isLoaded ifFalse: [^ super environment].
			^ PackageInfo squotEnvironmentOf: workingCopyArtifact]