dialog
openDialogToMaterializeChangeSets: changeSetCollection
windowTitle: titleString
	| workingCopy promise dialog |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	(SquotChangeSet allEmpty: changeSetCollection) ifTrue: [
		self inform: 'No changes to load.'.
		^ Promise unit: nil].
	promise := Promise new.
	(dialog := SquotChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Cancel';
		addButton: 'Load changes' action: [
			self validateDialogHasNoConflicts: dialog before: [
				workingCopy materializeChangeSets: changeSetCollection.
				dialog close.
				promise resolveWith: dialog]];
		open.
	^ promise