dialog
openDialogToCommitChangeSets: changeSetCollection
windowTitle: titleString
initialMessage: messageString
additionalParents: commitCollection
onlyAdditionalParents: overrideParentsBoolean
materializeChangeSets: materializeBoolean
	| workingCopy currentHeadCommit commitButtonLabel promise dialog |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	currentHeadCommit := self activeWorkingCopy headCommit.
	commitButtonLabel := commitCollection size > (overrideParentsBoolean ifTrue: [1] ifFalse: [0])
								ifTrue: ['Merge']
								ifFalse: ['Commit'].
	promise := Promise new.
	(dialog := SquotChangesDialogWithMessage onChangeSets: changeSetCollection)
		windowTitle: titleString;
		message: messageString;
		addCloseButton: 'Cancel';
		addButton: commitButtonLabel
		action: [
			self
				validateDialogState: dialog
				andOriginalHeadCommit: currentHeadCommit
				before: [ | shouldMaterialize |
					workingCopy
						commitChangeSets: changeSetCollection
						message: dialog message
						additionalParents: commitCollection
						onlyAdditionalParents: overrideParentsBoolean.
					shouldMaterialize := materializeBoolean or: [
						dialog wasEdited and: [self confirm: 'You edited some changes. Do you wish to load them into the image?']].
					shouldMaterialize ifTrue: [workingCopy materializeChangeSets: changeSetCollection].
					dialog close.
					promise resolveWith: dialog]];
		open.
	^ promise