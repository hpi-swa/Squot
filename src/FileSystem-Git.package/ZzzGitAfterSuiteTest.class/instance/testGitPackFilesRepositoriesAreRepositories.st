tests
testGitPackFilesRepositoriesAreRepositories
	GitPackFile allSubInstancesDo: [:each | self assert: each repository class = GitRepository].