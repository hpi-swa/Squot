private
newVersionForCommit: aGitCommit
	^ SquitVersion new
		repository: self;
		commit: aGitCommit;
		yourself