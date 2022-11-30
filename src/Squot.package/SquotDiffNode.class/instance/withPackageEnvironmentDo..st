as yet unclassified
withPackageEnvironmentDo: aBlock
	| workingCopyArtifact |
	workingCopyArtifact := workingCopy artifactAt: artifactDiff path ifAbsent: [].
	^ (workingCopyArtifact isNil or: [workingCopyArtifact isLoaded not])
		ifTrue: [aBlock value]
		ifFalse: [(PackageInfo squotEnvironmentOf: workingCopyArtifact) beCurrentDuring: aBlock]