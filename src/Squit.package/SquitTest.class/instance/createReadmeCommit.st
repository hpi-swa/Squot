test data
createReadmeCommit
	| snapshotWithReadme fs  |
	squitRepository withUnitOfWork:
	[snapshotWithReadme := SquotImageStore new
		add: 'test data' at: 'README.md';
		captureSnapshot.
	fs := fsGitRepository head.
	(SquotFileSystemStore inDirectory: fs root)
		restoreToSnapshot: snapshotWithReadme.
	fs commit: 'first commit'].