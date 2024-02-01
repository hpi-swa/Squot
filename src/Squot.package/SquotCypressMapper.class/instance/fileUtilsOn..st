as yet unclassified
fileUtilsOn: aDirectory
	^ (MCFileTreeFileSystemUtilsForSquot new)
		directory: aDirectory;
		yourself