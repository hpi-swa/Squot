as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference
	anArtifact content: (aFileOrDirectoryReference readStreamDo:
			                   [:stream | stream text contents])