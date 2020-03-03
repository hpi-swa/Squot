private
gitStoreOn: aGitCommit
	^ GitStore memory
		repository: self unitOfWork;
		revision: aGitCommit;
		yourself