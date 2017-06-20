testing
captureAndRestore: anObject
	| shadow restored |
	shadow := capturer capture: anObject.
	restored := materializer rematerialize: shadow.
	self assert: anObject equals: restored.
	^ restored