accessing
loadOrder
	^ (loadOrder ifNil: [loadOrder := objects keys asOrderedCollection ])
			addIfNotPresent: LBGitFilesArtifact path;
			yourself