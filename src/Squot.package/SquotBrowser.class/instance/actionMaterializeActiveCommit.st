actions
actionMaterializeActiveCommit
	| commit |
	commit := self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	self
		openDialogToMaterializeChangeSets:
			(self activeWorkingCopy changeSetsFromImageToCommit: commit)
		windowTitle: ('Materialize {1}' format: {commit showOneLine}).