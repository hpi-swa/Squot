tests
testGitStoreRepositoriesAreRepositories
	GitStore allSubInstancesDo: [:each | self assert: (each instVarNamed: 'repository') class = GitRepository].
	"Fixup:"
	"GitStore allSubInstancesDo: [:each |
		(each instVarNamed: 'repository') class = GitUnitOfWork ifTrue:
			[each repository: (each instVarNamed: 'repository') repository]]"