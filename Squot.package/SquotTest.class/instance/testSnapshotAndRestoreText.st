tests
testSnapshotAndRestoreText
	| text store snapshot |
	text := Text fromString: 'Original text'.
	store := SquotPurStore new.
	store add: text at: 'my text'.
	snapshot := store captureSnapshot.
	text replaceFrom: 1 to: text size with: 'New, unsaved value'.
	store restoreToSnapshot: snapshot.
	self assert: 'Original text' equals: text asString.