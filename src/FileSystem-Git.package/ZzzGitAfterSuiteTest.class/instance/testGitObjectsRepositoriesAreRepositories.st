tests
testGitObjectsRepositoriesAreRepositories
	GitObject allSubInstancesDo: [:each | self assert: each repository class = GitRepository].
	"Fixup:"
	"GitObject allSubInstancesDo: [:each |
		each repository class = GitUnitOfWork ifTrue:
			[each repository: each repository repository]]"