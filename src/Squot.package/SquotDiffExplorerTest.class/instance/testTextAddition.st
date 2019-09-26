tests
testTextAddition
	| patch snapshotWithText |
	snapshotWithText := SquotImageStore new
		add: (Text fromString: 'foo') at: 'text';
		captureSnapshot.
	patch := snapshotWithText patchRelativeToBase: SquotSnapshot empty.
	self openToolAndTestOnPatch: patch.