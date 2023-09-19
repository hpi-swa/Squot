dialog
openDialogToMaterializeChangeSets: changeSetCollection
windowTitle: titleString
	| workingCopy promise dialog |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	promise := Promise new.
	(dialog := SquotChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Cancel';
		addButton: 'Materialize' action: [
			self validateDialogHasNoConflicts: dialog before: [
				workingCopy materializeChangeSets: changeSetCollection.
				dialog close.
				promise resolveWith: dialog]];
		open.
	^ promise