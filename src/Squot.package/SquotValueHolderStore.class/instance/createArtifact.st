accessing artifacts
createArtifact
	artifact := SquotArtifact storeInfo:
		(SquotTrackedObjectMetadata withNewId
			at: 'references' put: 
				{'object' -> (OrderedDictionary newFrom:
					{'type' -> 'ValueHolder'})};
			yourself).
	^ self artifact