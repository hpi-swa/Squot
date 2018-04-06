user requests
chooseSubdirectory: aDirectoryReference ifCanceled: aBlock
	| fileDirectory subPath |
	fileDirectory := SquitSubFolderList
		modalFolderSelector: (FSFileDirectoryAdapter on: aDirectoryReference).
	fileDirectory ifNil: [^ aBlock value].
	(aDirectoryReference contains: fileDirectory) ifFalse: [^ aBlock value].
	subPath := fileDirectory asFSReference relativeTo: aDirectoryReference.
	^ SquotPath from: subPath