initialize-release
in: aGitRepositoryOrBlock
	aGitRepositoryOrBlock isBlock ifTrue: [^ super in: aGitRepositoryOrBlock].
	^ self new initializeOn: aGitRepositoryOrBlock; yourself