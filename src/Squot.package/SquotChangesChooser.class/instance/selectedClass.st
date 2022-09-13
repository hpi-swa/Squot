Smalltalk tools
selectedClass
	| workingCopyArtifact |
	self selectedNode ifNil: [^ super selectedClass].
	workingCopyArtifact := self workingCopy artifactAt: self selectedNode artifactDiff path ifAbsent: [^ super selectedClass].
	workingCopyArtifact isLoaded ifFalse: [^ super selectedClass].
	(self selectedNode content respondsTo: #actualClassInSquotWorkingCopy:)
		ifFalse: [^ super selectedClass].
	^ self selectedNode content actualClassInSquotWorkingCopy:
		(self workingCopy artifactAt: self selectedNode artifactDiff path)