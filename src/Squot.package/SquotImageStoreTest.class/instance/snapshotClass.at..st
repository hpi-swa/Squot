utilities
snapshotClass: aClass at: pathString
	class := aClass.
	^ SquotImageStore new
		add: class at: pathString;
		captureSnapshot