Smalltalk tools
selectedClass
	self selectedNode ifNil: [^ super selectedClass].
	(self selectedNode content respondsTo: #actualClassInSquotWorkingCopy:)
		ifFalse: [^ super selectedClass].
	^ self selectedNode content actualClassInSquotWorkingCopy:
		(self workingCopy artifactAt: self selectedNode artifactDiff path)