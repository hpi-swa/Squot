dialog
openDialogToCommitChangeSets: changeSetCollection
windowTitle: titleString
initialMessage: messageString
additionalParents: commitCollection
materializeChangeSets: materializeBoolean
	| workingCopy currentHeadCommit promise dialog |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	currentHeadCommit := self activeWorkingCopy headCommit.
	promise := Promise new.
	(dialog := SquotChangesDialogWithMessage onChangeSets: changeSetCollection)
		windowTitle: titleString;
		message: messageString;
		addCloseButton: 'Cancel';
		addButton: (commitCollection ifEmpty: ['Commit'] ifNotEmpty: ['Merge'])
		action: [
			self
				validateDialogState: dialog
				andOriginalHeadCommit: currentHeadCommit
				before: [ | shouldMaterialize |
					workingCopy
						commitChangeSets: changeSetCollection
						message: dialog message
						additionalParents: commitCollection.
					shouldMaterialize := materializeBoolean or: [
						dialog wasEdited and: [self confirm: 'You edited some changes. Do you wish to load them into the image?']].
					shouldMaterialize ifTrue: [workingCopy materializeChangeSets: changeSetCollection].
					dialog close.
					promise resolveWith: dialog]];
		open.
	^ promise