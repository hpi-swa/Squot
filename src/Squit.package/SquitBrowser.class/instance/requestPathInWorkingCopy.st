actions
requestPathInWorkingCopy
	| version subPath gitRepository rootDirectory |
	gitRepository := self projectSelection repository gitRepository repository.
	gitRepository workingCopyDirDo: [:workingCopyDir |
			subPath := self chooseSubdirectory: workingCopyDir ifCanceled: [^ nil]]
		ifBareOrAbsent: ["choose from existing directories"
			version := self projectSelection loadedHistorian version.
			version
				ifNil: [subPath := UIManager default
						request: 'Enter the relative path in the working copy for the package'
						initialAnswer: 'src']
				ifNotNil: [rootDirectory := SquitRepositoryFilesystemExtension new
						repository: self projectSelection repository;
						forVersion: version.
					subPath := self chooseSubdirectory: rootDirectory ifCanceled: [^ nil]]].
	subPath ifNotEmpty: [
		subPath first asString = FileDirectory slash
			ifTrue: [subPath := subPath allButFirst]].
	(subPath beginsWith: '.git') ifTrue: [self error: 'Cannot use this path to store objects: ', subPath].
	^ subPath