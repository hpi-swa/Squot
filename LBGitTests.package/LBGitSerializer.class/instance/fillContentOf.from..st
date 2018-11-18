as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference

	anArtifact content: 
		(SquotShadowGraph withSingleShadow:
			(LBGitDeserializedShadow onReference: aFileOrDirectoryReference))