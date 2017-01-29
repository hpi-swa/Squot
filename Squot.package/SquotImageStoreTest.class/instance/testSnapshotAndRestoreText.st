tests
testSnapshotAndRestoreText
	| text snapshot |
	text := Text fromString: 'Original text'.
	imageStore add: text at: 'my text'.
	snapshot := imageStore captureSnapshot.
	text replaceFrom: 1 to: text size with: 'New, unsaved value'.
	imageStore restoreToSnapshot: snapshot.
	self assert: 'Original text' equals: text asString.