private
gitStoreOn: aGitCommit
	^ FileSystemStoreGit memory
		repository: repository;
		revision: aGitCommit;
		yourself