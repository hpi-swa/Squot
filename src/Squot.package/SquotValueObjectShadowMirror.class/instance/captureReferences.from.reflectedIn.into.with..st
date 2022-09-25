capturing
captureReferences: aCollection from: anObject reflectedIn: aMirror into: aValueObjectShadow with: aCapturer
	super captureReferences: aCollection from: anObject reflectedIn: aMirror into: aValueObjectShadow with: aCapturer.
	aValueObjectShadow liveObject: anObject.