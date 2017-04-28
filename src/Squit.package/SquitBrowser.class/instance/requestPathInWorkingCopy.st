actions
requestPathInWorkingCopy
	| version subPath gitRepository isBare worktreeDir worktreePath |
	gitRepository := self projectSelection repository gitRepository repository.
	isBare := (gitRepository configAt: 'core.bare' ifAbsent: ['false']) gitConfigBoolean.
	worktreePath := gitRepository configAt: 'core.worktree' ifAbsent: ['..'].
	(isBare not and: [(worktreeDir := gitRepository baseDir resolve: worktreePath) isDirectory])
		ifTrue: [subPath := self chooseSubdirectory: worktreeDir ifCanceled: [^ nil]]
		ifFalse: ["no working copy in the filesystem, choose from existing directories"
			version := self projectSelection loadedHistorian version.
			version
				ifNil: [subPath := UIManager default
						request: 'Enter the relative path in the working copy for the package'
						initialAnswer: 'src']
				ifNotNil: [worktreeDir := SquitRepositoryFilesystemExtension new
						repository: self projectSelection repository;
						forVersion: version.
					subPath := self chooseSubdirectory: worktreeDir ifCanceled: [^ nil]]].
	subPath ifNotEmpty: [
		subPath first asString = FileDirectory slash
			ifTrue: [subPath := subPath allButFirst]].
	(subPath beginsWith: '.git') ifTrue: [self error: 'Cannot use this path to store objects: ', subPath].
	^ subPath