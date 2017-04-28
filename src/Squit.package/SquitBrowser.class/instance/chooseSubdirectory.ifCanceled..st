user requests
chooseSubdirectory: aDirectoryReference ifCanceled: aBlock
	| path |
	path := SquitSubFolderList
		modalFolderSelector: (FSFileDirectoryAdapter on: aDirectoryReference).
	path ifNil: [^ aBlock value].
	(path pathName beginsWith: aDirectoryReference pathString)
		ifFalse: [^ aBlock value].
	^ path pathName allButFirst: aDirectoryReference pathString size