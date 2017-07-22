testing
captureAndRestore: anObject
	| shadow restored |
	shadow := capturer captureStandalone: anObject.
	restored := materializer rematerialize: shadow.
	self assert: anObject equals: restored.
	^ restored