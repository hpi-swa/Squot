tests
testGitObjectsRepositoriesAreRepositories
	GitObject allSubInstancesDo: [:each | self assert: each repository class = GitRepository].