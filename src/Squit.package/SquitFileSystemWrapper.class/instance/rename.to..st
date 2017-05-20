intercepted
rename: sourcePath to: destPath
	| sourceReference old destReference new |
	sourceReference := wrappedFilesystem referenceTo: sourcePath.
	sourceReference exists ifTrue: [old := sourceReference allFiles].
	wrappedFilesystem rename: sourcePath to: destPath.
	destReference := wrappedFilesystem referenceTo: destPath.
	destReference exists ifTrue: [new := destReference allFiles].
	changedPaths add: sourcePath; add: destPath.
	changedPaths addAll: old; addAll: new.