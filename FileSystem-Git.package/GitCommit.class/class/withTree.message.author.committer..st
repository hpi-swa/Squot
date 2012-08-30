instance creation
withTree: aGitTree message: aString author: aGitStampForAuthor committer: aGitStampForCommitter
	^self new
		tree: aGitTree;
		message: aString;
		author: aGitStampForAuthor;
		committer: aGitStampForCommitter;
		yourself
		