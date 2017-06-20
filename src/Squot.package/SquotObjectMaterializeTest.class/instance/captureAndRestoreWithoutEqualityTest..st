testing
captureAndRestoreWithoutEqualityTest: anObject
	| shadow restored |
	shadow := capturer capture: anObject.
	restored := materializer rematerialize: shadow.
	^ restored