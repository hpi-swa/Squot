as yet unclassified
commit 

	^ self isInGit
		ifTrue: [self rootDirectory fileSystem store revision]
		ifFalse: [nil]