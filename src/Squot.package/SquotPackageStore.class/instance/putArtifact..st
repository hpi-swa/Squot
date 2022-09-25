accessing artifacts
putArtifact: aSquotArtifactSnapshot
	"Load the package."
	| loader |
	environment beCurrentDuring: 
		[loader := MCPackageLoader new.
		loader installSnapshot: aSquotArtifactSnapshot objectSnapshot startShadow asMCSnapshot;
			loadWithNameLike: (self packageNameOf: aSquotArtifactSnapshot artifact)].