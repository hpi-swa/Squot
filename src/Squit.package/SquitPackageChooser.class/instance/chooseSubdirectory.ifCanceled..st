choosing packages
chooseSubdirectory: aDirectoryReference ifCanceled: aBlock
	| fileDirectory chosenDirectory subPath |
	fileDirectory := SquitSubFolderChooserDialog
		openOn: (FSFileDirectoryAdapter on: aDirectoryReference)
		label: 'Choose a directory where the package(s) should be stored'.
	fileDirectory ifNil: [^ aBlock value].
	chosenDirectory := fileDirectory asFSReference.
	(chosenDirectory = aDirectoryReference
		or: [aDirectoryReference contains: chosenDirectory]) ifFalse: [^ aBlock value].
	subPath := chosenDirectory relativeTo: aDirectoryReference.
	^ SquotPath from: subPath