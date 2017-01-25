utilities
snapshotClass: aClass at: pathString
	class := aClass.
	store := SquotPurStore new.
	store add: class at: pathString.
	^ store captureSnapshot