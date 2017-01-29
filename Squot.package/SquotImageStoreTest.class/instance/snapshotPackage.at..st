utilities
snapshotPackage: aPackageInfo at: pathString
	^ SquotImageStore new
		add: aPackageInfo at: pathString;
		captureSnapshot