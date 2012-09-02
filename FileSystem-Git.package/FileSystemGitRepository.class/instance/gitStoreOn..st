private
gitStoreOn: aGitCommit
	self haltIf: aGitCommit isNil.
	^ GitStore memory
		repository: repository;
		revision: aGitCommit;
		yourself