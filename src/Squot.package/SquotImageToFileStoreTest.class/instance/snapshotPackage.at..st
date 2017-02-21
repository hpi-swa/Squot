utilities
snapshotPackage: aPackageInfo at: pathString
	imageStore add: aPackageInfo at: pathString.
	fileStore restoreToSnapshot: imageStore captureSnapshot.