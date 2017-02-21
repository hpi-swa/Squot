private
filesystemOn: aGitCommit
	^ (GitFilesystem store: (self gitStoreOn: aGitCommit))
			repository: self;
			yourself