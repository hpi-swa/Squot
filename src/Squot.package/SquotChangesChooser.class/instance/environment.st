Smalltalk tools
environment
	self selectedNode ifNil: [^ super environment].
	^ PackageInfo squotEnvironmentOf:
		(self workingCopy artifactAt: (self selectedNode artifactDiff ifNil: [^ super environment]) path
			ifAbsent: [^ super environment])