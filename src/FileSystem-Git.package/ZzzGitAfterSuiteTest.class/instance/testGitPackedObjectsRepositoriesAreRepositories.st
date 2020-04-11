tests
testGitPackedObjectsRepositoriesAreRepositories
	GitPackedObject allSubInstancesDo: [:each | self assert: each repository class = GitRepository].