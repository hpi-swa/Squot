choosing packages
chooseSubdirectory: aDirectoryReference ifCanceled: aBlock
	| fileDirectory chosenDirectory subPath |
	fileDirectory := SquitDirectoryInWorkingCopyChooser openOn: (FSFileDirectoryAdapter on: aDirectoryReference) label: 'Directory for added packages'.
	fileDirectory ifNil: [^ aBlock value].
	chosenDirectory := fileDirectory asFSReference.
	(chosenDirectory = aDirectoryReference
		or: [aDirectoryReference contains: chosenDirectory]) ifFalse: [^ aBlock value].
	subPath := chosenDirectory relativeTo: aDirectoryReference.
	^ SquotPath from: subPath