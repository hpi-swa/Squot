private
gitStoreOn: aGitCommit
	^ GitStore memory
		repository: repository;
		revision: aGitCommit;
		yourself