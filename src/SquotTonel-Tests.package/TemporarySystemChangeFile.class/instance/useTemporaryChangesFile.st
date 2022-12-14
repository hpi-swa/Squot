accessing
useTemporaryChangesFile
	Smalltalk closeSourceFiles.
	tempChangesFile := self directory forceNewFileNamed: self tempChangesName.
	SourceFiles at: 2 put: tempChangesFile