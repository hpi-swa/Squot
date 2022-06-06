actions
browseInWorkingCopy
	self content ifNotNil:
		[:object | | path |
		path := self artifactDiff ifNotNil: [:diff | diff path].
		(self workingCopy includesObjectAt: path) ifFalse: [^ SquotGUI inform: 'Object is not loaded'].
		object browseFromSquotWorkingCopyArtifact:
			(path ifNotNil: [self workingCopy artifactAt: path] ifNil: [])].