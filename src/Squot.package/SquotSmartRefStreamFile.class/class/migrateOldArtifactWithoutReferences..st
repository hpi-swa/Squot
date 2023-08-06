update migration
migrateOldArtifactWithoutReferences: aTrackedObjectMetadata
	aTrackedObjectMetadata at: 'references' put:
		{'object' -> (OrderedDictionary newFrom:
			{'type' -> 'ValueHolder'.
			'content-type' -> 'application/octet-stream'.
			'codec-class' -> 'SmartRefStream'})}.