Squot deserialization
fillContentOf: anArtifact from: aFileOrDirectoryReference
	anArtifact content:
		(SquotShadowGraph withSingleShadow:
			(aFileOrDirectoryReference readStreamDo: [:stream | stream text contents])
				captureWithSquot undecorated)