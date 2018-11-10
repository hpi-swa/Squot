as yet unclassified
fillContentOf: anArtifact from: aFileOrDirectoryReference
	| path |
	self halt.
	path := ''.
	aFileOrDirectoryReference path do: [:each | path := path,'/',each].
	anArtifact content: 
		(SquotShadowGraph withSingleShadow:
			((LBGitFileShadow of: (LBGitFileInfo onGitReference: aFileOrDirectoryReference))
			content: (aFileOrDirectoryReference readStreamDo: [:stream | stream binary contents])))