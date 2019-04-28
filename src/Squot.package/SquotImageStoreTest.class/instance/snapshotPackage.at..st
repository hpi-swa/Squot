utilities
snapshotPackage: aPackageInfo at: pathString
	^ SquotImageStore new
		add: aPackageInfo at: pathString;
		removeAt: SquotFilesArtifact path;
		captureSnapshot