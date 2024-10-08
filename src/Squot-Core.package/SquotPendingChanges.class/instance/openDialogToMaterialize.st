actions-private
openDialogToMaterialize
	^ self
		openDialog: SquotChangesDialog
		action: [self postDialogMaterialize]
		label: 'Load changes'.