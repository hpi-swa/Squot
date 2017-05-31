building
buildVersion
	"Create the commit and answer the SquitVersion for it"
	| fs fsStore commit |
	self assert: (patch notNil or: [snapshot notNil]).
	fs := parents
		ifEmpty: [repository orphanedWorkingDirectory]
		ifNotEmpty: [repository workingTreeForCommitNamed: parents first hexHash].
	fsStore := SquotFileSystemStore inDirectory: fs root.
	shouldStoreMetadata ifFalse: [fsStore doNotStoreMetadata].
	snapshot ifNotNil: [fsStore restoreToSnapshot: snapshot].
	patch ifNotNil: [fsStore applyPatch: patch].
	(commit := fs prepareNewCommit)
		message: (self message withLineEndings: String lf);
		parents: (parents collect: [:each | each hexHash]);
		author: author;
		committer: committer;
		store.
	SquotArtifactsWereCaptured new artifacts: fsStore capturedArtifacts; signal.
	^ repository versionForCommit: commit