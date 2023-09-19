dialog
openDialogToMaterializeChangeSets: changeSetCollection
windowTitle: titleString
	| promise dialog |
	promise := Promise new.
	(dialog := SquotChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Cancel';
		addButton: 'Materialize' action: [
			self validateDialogHasNoConflicts: dialog before: [
				self workingCopy materializeChangeSets: changeSetCollection.
				dialog close.
				promise resolveWith: dialog]];
		open.
	^ promise