dialog
openDialogToShowChangeSets: changeSetCollection windowTitle: titleString
	(GSChangeSet allEmpty: changeSetCollection) ifTrue: [^ self inform: 'No changes to show.'].
	(GSChangesDialog onChangeSets: changeSetCollection)
		windowTitle: titleString;
		addCloseButton: 'Close';
		open.