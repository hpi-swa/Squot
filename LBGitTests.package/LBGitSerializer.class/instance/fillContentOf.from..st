as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference
	self halt.
	anArtifact content: 
		(SquotShadowGraph withSingleShadow:
			((LBGitFileShadow of: (LBGitFileInfo onGitReference: aFileOrDirectoryReference))
			content: (aFileOrDirectoryReference readStreamDo: [:stream | stream binary contents]);
			isOnGit: true;
			yourself))