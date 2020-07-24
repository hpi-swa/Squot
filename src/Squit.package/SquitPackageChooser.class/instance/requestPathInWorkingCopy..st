choosing packages
requestPathInWorkingCopy: aWorkingCopy
	| version subPath gitRepository rootDirectory |
	gitRepository := aWorkingCopy repository git.
	gitRepository workingCopyDirDo: [:workingCopyDir |
			subPath := self chooseSubdirectory: workingCopyDir ifCanceled: [^ nil]]
		ifBareOrAbsent: ["choose from existing directories"
			version := aWorkingCopy loadedHistorian version.
			version
				ifNil: [subPath := SquotGUI
						request: 'Enter the relative path in the working copy for the added packages'
						initialAnswer: 'src']
				ifNotNil: [rootDirectory := SquitRepositoryFilesystemExtension new
						repository: aWorkingCopy repository;
						forVersion: version.
					subPath := self chooseSubdirectory: rootDirectory ifCanceled: [^ nil]]].
	subPath ifNotEmpty: [
		subPath first asString = FileDirectory slash
			ifTrue: [subPath := subPath allButFirst]].
	(subPath beginsWith: '.git') ifTrue: [self error: 'Cannot use this path to store objects: ', subPath].
	^ subPath