dialog
openDialogToShowChangeSets: changeSetCollection windowTitle: titleString
	(SquotChangeSet allEmpty: changeSetCollection) ifTrue: [^ self inform: 'No changes to show.'].
	(SquotChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Close';
		open.