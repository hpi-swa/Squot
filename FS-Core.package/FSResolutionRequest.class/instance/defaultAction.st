exceptionDescription
defaultAction
	| filedir ref |
	filedir := UIManager default chooseDirectory: 'Where is ', origin, '?'.
	ref := filedir ifNotNil: [FSFilesystem onDisk referenceTo: filedir fullName].
	self resume: ref