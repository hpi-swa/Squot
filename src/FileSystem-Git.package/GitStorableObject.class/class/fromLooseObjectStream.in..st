initialize-release
fromLooseObjectStream: aStream in: aGitRepository
	^ self fromLooseObjectStream: aStream in: aGitRepository hash: nil