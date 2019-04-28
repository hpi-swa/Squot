as yet unclassified
isInGit

	"False is unusual, but possible in certain test cases when a file store is created without a repository"
	^ self rootDirectory fileSystem isKindOf: GitFilesystem