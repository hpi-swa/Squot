dialog
openDialogToShowChangeSets: changeSetCollection
fromDisplayName: aString
toDisplayName: anotherString
	self
		openDialogToShowChangeSets: changeSetCollection
		windowTitle: ('Show changes from {1} to {2}' format: {aString. anotherString}).