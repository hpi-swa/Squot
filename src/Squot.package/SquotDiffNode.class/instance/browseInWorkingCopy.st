actions
browseInWorkingCopy
	self content ifNotNil:
		[:object | | path |
		path := self artifactDiff ifNotNil: [:diff | diff path].
		object browseFromSquotWorkingCopyArtifact:
			(path ifNotNil: [self workingCopy artifactAt: path] ifNil: [])].