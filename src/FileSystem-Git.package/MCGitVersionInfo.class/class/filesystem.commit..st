instance creation
filesystem: aGitFS commit: aGitCommit
	^ self basicNew 
		initializeWithFilesystem: aGitFS commit: aGitCommit