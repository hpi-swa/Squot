actions
actionImportFile
	| path reference |
	path := (UIManager default chooseFileMatching: '*') ifNil: [^ self].
	reference := FileSystem disk referenceTo: path.
	self importFile: reference.