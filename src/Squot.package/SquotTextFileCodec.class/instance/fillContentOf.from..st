Squot deserialization
fillContentOf: anArtifact from: aFileOrDirectoryReference
	anArtifact content:
		(SquotShadowGraph withSingleShadow:
			(SquotBitsObjectShadow for:
				(aFileOrDirectoryReference readStreamDo: [:stream | stream text contents])))