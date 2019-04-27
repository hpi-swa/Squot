utilities
snapshotClass: aClass at: pathString
	^ SquotImageStore new
		add: aClass at: pathString;
		removeAt: LBGitFilesArtifact path;
		captureSnapshot