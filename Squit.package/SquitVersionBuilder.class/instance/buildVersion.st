building
buildVersion
	"Create the commit and answer the SquitVersion for it"
	| fs |
	fs := parents
		ifEmpty: [repository orphanedWorkingDirectory]
		ifNotEmpty: [repository workingTreeForCommitNamed: parents first hexHash].
	(SquotFileSystemStore inDirectory: fs root) 	restoreToSnapshot: snapshot.
	fs commit: message.
	self flag: 'TODO: handle different author, committer and multiple parents'.
	self flag: 'TODO: do not update any reference (which GitFilesystem>>commit: does)'.
	^ repository versionForCommit: fs revision