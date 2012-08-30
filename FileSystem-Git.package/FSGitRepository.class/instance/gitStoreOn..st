private
gitStoreOn: aGitCommit
	^ FSGitStore memory
		repository: repository;
		revision: aGitCommit;
		yourself