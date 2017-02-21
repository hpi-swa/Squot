utilities
snapshotClass: aClass at: pathString
	class := aClass.
	imageStore add: class at: pathString.
	fileStore restoreToSnapshot: imageStore captureSnapshot.