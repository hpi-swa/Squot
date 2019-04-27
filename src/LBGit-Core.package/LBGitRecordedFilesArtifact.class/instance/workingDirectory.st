as yet unclassified
workingDirectory 

	^ self isInGit
		ifTrue: [self rootDirectory fileSystem repository repository workingDir]
		ifFalse: [self rootDirectory].