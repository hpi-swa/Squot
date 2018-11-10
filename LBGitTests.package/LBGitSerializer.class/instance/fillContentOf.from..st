as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference

	self halt.
	anArtifact content: 
		(SquotShadowGraph withSingleShadow:
			(LBGitFileShadow new content: (aFileOrDirectoryReference readStreamDo: [:stream | stream binary contents])))