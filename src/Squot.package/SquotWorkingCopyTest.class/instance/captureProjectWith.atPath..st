utilities
captureProjectWith: anObject atPath: aString
	^ SquotToggles useNewApi
		ifTrue:
			[| artifact workingCopy |
			artifact := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewId
				at: 'path' put: aString;
				at: 'references' put:
					{'value_1' -> (Dictionary newFrom:
						{'type' -> 'ValueHolder'. "This does not mean the class of 'object', but that nothing in the image references this object, except for the working copy store itself."
						'content-type' -> 'application/octet-stream'.
						'codec-class' -> 'SmartRefStream'})};
				yourself).
			workingCopy := SquotWorkingCopy2 new.
			(workingCopy
				putArtifact: artifact;
				storeForArtifact: artifact) contents: anObject.
			workingCopy snapshot]
		ifFalse: [SquotImageStore new add: anObject at: aString; captureSnapshot]