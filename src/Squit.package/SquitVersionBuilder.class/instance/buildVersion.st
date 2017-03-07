building
buildVersion
	"Create the commit and answer the SquitVersion for it"
	| fs fsStore commit |
	fs := parents
		ifEmpty: [repository orphanedWorkingDirectory]
		ifNotEmpty: [repository workingTreeForCommitNamed: parents first hexHash].
	fsStore := SquotFileSystemStore inDirectory: fs root.
	shouldStoreMetadata ifFalse: [fsStore doNotStoreMetadata].
	fsStore restoreToSnapshot: snapshot.
	(commit := fs prepareNewCommit)
		message: (self message withLineEndings: String lf);
		parents: (parents collect: [:each | each hexHash]);
		author: author;
		committer: committer;
		store.
	^ repository versionForCommit: commit