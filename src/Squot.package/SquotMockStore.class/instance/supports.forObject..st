adding and removing
supports: aTrackedObjectMetadata forObject: anObject
	| copy path expectedPath |
	copy := aTrackedObjectMetadata copy.
	self initializeStoreInfo: copy forObject: anObject.
	path := aTrackedObjectMetadata at: #path.
	expectedPath := copy at: #path.
	^ path = expectedPath