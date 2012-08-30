private
filesystemOn: aGitCommit
	^ (FSGitFilesystem store: (self gitStoreOn: aGitCommit))
			repository: self;
			yourself