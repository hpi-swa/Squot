building
buildVersion
	"Create the commit and answer the SquitVersion for it"
	| fs fsStore commit newSnapshot |
	self assert: (patch notNil or: [snapshot notNil]).
	self assert: (parents notNil and: [message notNil and: [author notNil and: [committer notNil]]]).
	fs := parents
		ifEmpty: [repository orphanedWorkingDirectory]
		ifNotEmpty: [repository workingTreeForCommitNamed: parents first hexHash].
	fsStore := SquotFileSystemStore inDirectory: fs root.
	shouldStoreMetadata ifFalse: [fsStore doNotStoreMetadata].
	SquotProgress displayStatus: 'Serializing objects to Git' during:
	[snapshot ifNotNil: [newSnapshot := fsStore restoreToSnapshot: snapshot].
	patch ifNotNil: [newSnapshot := fsStore applyPatch: patch]].
	(commit := fs prepareNewCommit)
		message: (self message withLineEndings: String lf);
		parents: (parents collect: [:each | each hexHash]);
		author: author;
		committer: (commitTimestamp ifNil: [committer now] ifNotNil: [committer atTime: commitTimestamp]);
		store.
	SquotArtifactsWereCaptured new artifacts: fsStore capturedArtifacts; signal.
	^ SquotMemoizingVersion version: (repository versionForCommit: commit) snapshot: newSnapshot