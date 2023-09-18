dialog
openDialogToCommitChangeSets: changeSetCollection
windowTitle: titleString
initialMessage: messageString
additionalParents: commitCollection
materializeChangeSets: materializeBoolean
	| currentHeadCommit dialog |
	currentHeadCommit := self workingCopy headCommit.
	^ (dialog := SquotChangesDialogWithMessage onChangeSets: changeSetCollection)
		windowTitle: titleString;
		message: messageString;
		addCloseButton: 'Cancel';
		addButton: (commitCollection ifEmpty: ['Commit'] ifNotEmpty: ['Merge'])
		action: [
			self
				validateDialogState: dialog
				andOriginalHeadCommit: currentHeadCommit
				before: [
					self workingCopy
						commitChangeSets: changeSetCollection
						message: dialog message
						additionalParents: commitCollection].
					materializeBoolean ifTrue: [self workingCopy materializeChangeSets: changeSetCollection].
					dialog close];
		open;
		yourself