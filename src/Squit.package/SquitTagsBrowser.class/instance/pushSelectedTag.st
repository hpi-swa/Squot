actions
pushSelectedTag
	| tagName allRemoteNames remoteName |
	selectedTagName ifNil: [^ self errorNoTagSelected].
	tagName := 'refs/tags/', selectedTagName.
	[repository withUnitOfWork:		
		[allRemoteNames := repository fsgitRepository remoteNames select: [:each | (repository fsgitRepository remoteUrl: each) beginsWith: 'http'].
		remoteName := SquotGUI chooseFrom: allRemoteNames values: allRemoteNames title: 'Push tag to which remote?' translated.
		repository git remoteNamed: remoteName.
		(SquitInteractivePush
			historian: (repository historianNamed: tagName)
			remote: (repository git remoteNamed: remoteName)
			remoteBranchName: tagName)
			push]] fork.