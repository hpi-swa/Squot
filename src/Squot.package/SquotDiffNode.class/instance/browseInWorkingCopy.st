actions
browseInWorkingCopy
	self content ifNotNil:
		[:object |
		object browseFromSquotWorkingCopyArtifact:
			(self workingCopy artifactAt: self artifactDiff path)].