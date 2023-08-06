artifact creation
setUpArtifactMetadata: aTrackedObjectMetadata referenceNamed: aString
	(aTrackedObjectMetadata references at: aString)
		at: 'content-type' put: 'application/octet-stream';
		at: 'codec-class' put: 'SmartRefStream'.
	^ aTrackedObjectMetadata