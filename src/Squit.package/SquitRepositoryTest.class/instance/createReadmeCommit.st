test data
createReadmeCommit
	| snapshotWithReadme fs  |
	snapshotWithReadme := SquotImageStore new
		add: 'test data' at: 'README.md';
		captureSnapshot.
	fs := gitRepository head.
	(SquotFileSystemStore inDirectory: fs root)
		restoreToSnapshot: snapshotWithReadme.
	fs commit: 'first commit'.