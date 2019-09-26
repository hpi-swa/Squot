tests
testTextRemoval
	| patch snapshotWithText |
	snapshotWithText := SquotImageStore new
		add: (Text fromString: 'foo') at: 'text';
		captureSnapshot.
	patch := SquotSnapshot empty patchRelativeToBase: snapshotWithText.
	self openToolAndTestOnPatch: patch.