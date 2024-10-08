actions-private
openDialog: aChangesDialogClass action: aBlock label: aString
	self dialog: (aChangesDialogClass onChangeSets: self changeSets).
	self dialog
		windowTitle: self windowTitle;
		addCloseButton: 'Cancel';
		addButton: aString action: aBlock;
		open.
	^ self promise