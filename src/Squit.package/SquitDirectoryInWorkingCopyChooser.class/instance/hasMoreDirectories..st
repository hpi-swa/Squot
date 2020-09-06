as yet unclassified
hasMoreDirectories: aDirectory
	workingCopyDirectory = aDirectory ifTrue:
		[^ "exclude .git" aDirectory asFSReference entries anySatisfy: [:each | each isDirectory and: [each basename ~= '.git']]].
	^ super hasMoreDirectories: aDirectory