private
filesystemOn: aGitCommit
	^ (FileSystemGit store: (self gitStoreOn: aGitCommit))
			repository: self;
			yourself