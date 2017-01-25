utilities
snapshotPackage: aPackageInfo at: pathString
	store := SquotPurStore new.
	store add: aPackageInfo at: pathString.
	^ store captureSnapshot