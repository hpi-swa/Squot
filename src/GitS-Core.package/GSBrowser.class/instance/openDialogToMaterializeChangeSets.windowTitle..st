dialog
openDialogToMaterializeChangeSets: changeSetCollection
windowTitle: titleString
	| workingCopy promise dialog |
	workingCopy := self activeWorkingCopyIfNilInformAnd: [^ Promise new "never resolves"].
	(GSChangeSet allEmpty: changeSetCollection) ifTrue: [
		self inform: 'No changes to load.'.
		^ Promise unit: nil].
	promise := Promise new.
	(dialog := GSChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Cancel';
		addButton: 'Load changes' action: [
			self validateDialogHasNoConflicts: dialog before: [
				workingCopy materializeChangeSets: changeSetCollection.
				dialog close.
				promise resolveWith: dialog]];
		open.
	^ promise