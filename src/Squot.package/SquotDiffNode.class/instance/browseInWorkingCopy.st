actions
browseInWorkingCopy
	self content ifNotNil:
		[:object | | path |
		SquotToggles useNewApi
			ifTrue:
				[(self workingCopy project includesArtifactWithId: self artifactDiff incoming artifact id) ifFalse: [^ SquotGUI inform: 'Object is not loaded'].
				self flag: #todo. "In the save dialog, the incoming artifact id must be used, but when merging the working artifact id should be used!"
				self flag: #todo. "Many object implementations want to know whether the artifact is loaded, but cannot know it with the new API. Need to pass the store in addition to the artifact."
				object browseFromSquotWorkingCopyArtifact:
					(self workingCopy project artifactAt: self artifactDiff incoming artifact id)]
			ifFalse:
				[path := self artifactDiff ifNotNil: [:diff | diff path].
				(self workingCopy includesObjectAt: path) ifFalse: [^ SquotGUI inform: 'Object is not loaded'].
				object browseFromSquotWorkingCopyArtifact:
					(path ifNotNil: [self workingCopy artifactAt: path] ifNil: [])]].