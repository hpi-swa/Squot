testing
captureAndRestoreWithoutEqualityTest: anObject
	| shadow restored |
	shadow := capturer captureStandalone: anObject.
	restored := materializer rematerialize: shadow.
	^ restored