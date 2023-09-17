dialog
openDialogToCommitChangeSets: aCollection additionalParents: anotherCollection
	| currentHeadCommit |
	currentHeadCommit := self workingCopy headCommit.
	^ (SquotChangesDialogWithMessage onChangeSets: aCollection)
		addCloseButton: 'Cancel';
		addButton: (anotherCollection ifEmpty: ['Commit'] ifNotEmpty: ['Merge'])
		action: [:dialog |
			self validateDialogState: dialog
				andOriginalHeadCommit: currentHeadCommit
				before: [
					self workingCopy
						commitChangeSets: aCollection
						message: dialog message
						additionalParents: anotherCollection]];
		open;
		yourself