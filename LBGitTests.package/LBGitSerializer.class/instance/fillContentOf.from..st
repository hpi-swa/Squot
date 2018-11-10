as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference

	self halt.
	anArtifact content: 
		(SquotShadowGraph withSingleShadow:
			(aFileOrDirectoryReference readStreamDo: [:stream | stream binary contents])
				captureWithSquot undecorated)