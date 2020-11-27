accessing objects
metadataForObjectAt: path
	^ (self unloadedArtifacts
			at: path
			ifAbsent: [^ store metadataForObjectAt: path])
		storeInfo