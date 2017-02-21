instance creation
withTree: aGitTree message: aString author: aGitStampForAuthor committer: aGitStampForCommitter in: aRepository
	^self new
		tree: aGitTree;
		message: aString;
		author: aGitStampForAuthor;
		committer: aGitStampForCommitter;
		repository: aRepository;
		yourself