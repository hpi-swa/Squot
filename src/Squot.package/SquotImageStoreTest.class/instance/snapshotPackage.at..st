utilities
snapshotPackage: aPackageInfo at: pathString
	^ SquotImageStore new
		add: aPackageInfo at: pathString;
		removeAt: LBGitFilesArtifact path;
		captureSnapshot