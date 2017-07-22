Squot deserialization
fillContentOf: anArtifact from: aFileOrDirectoryReference
	anArtifact content:
		(SquotObjectGraph withSingleShadow:
			(SquotBitsObjectShadow for:
				(aFileOrDirectoryReference readStreamDo: [:stream | stream text contents])))