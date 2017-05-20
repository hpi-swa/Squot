intercepted
rename: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock
	| old sourceReference destReference new |
	sourceReference := wrappedFilesystem referenceTo: sourcePath.
	sourceReference exists ifTrue: [old := sourceReference allFiles].
	wrappedFilesystem
		rename: sourcePath
		ifAbsent: [^ absentBlock value]
		to: destinationPath
		ifPresent: [^ presentBlock value].
	destReference := wrappedFilesystem referenceTo: destinationPath.
	destReference exists ifTrue: [new := destReference allFiles].
	changedPaths add: sourcePath; add: destinationPath.
	changedPaths addAll: old; addAll: new.