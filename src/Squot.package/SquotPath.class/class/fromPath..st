converting
fromPath: aFSPath
	^ aFSPath isWorkingDirectory
		ifTrue: ['']
		ifFalse: [aFSPath printWithDelimiter: self delimiter]