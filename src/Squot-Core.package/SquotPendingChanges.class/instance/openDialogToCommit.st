actions-private
openDialogToCommit
	self
		openDialog: SquotChangesDialogWithMessage
		action: [self postDialogCommit]
		label: self commitButtonLabel.
	self dialog message: self initialMessage.
	^ self promise