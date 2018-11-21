test data
repositoryForTests
	| directory |
	directory := self repositoryPathForTests asFileReference.
	self deny: directory exists
		description: 'failsafe: repository exists'.
	^ FileSystemGitRepository on: directory