accessing artifacts
putArtifact: aSquotArtifactSnapshot 
	"Load the class."
	| loader className existing patch |
	loader := MCPackageLoader new.
	environment beCurrentDuring: 
		[className := self classNameOf: aSquotArtifactSnapshot artifact.
		(environment classNamed: className)
			ifNil: [loader installSnapshot: aSquotArtifactSnapshot objectSnapshot startShadow asMCSnapshot]
			ifNotNil:
				[existing := self monticelloSnapshot: (environment classNamed: className).
				patch := aSquotArtifactSnapshot objectSnapshot startShadow asMCSnapshot patchRelativeToBase: existing.
				patch applyTo: loader].
		loader loadWithNameLike: (self classNameOf: aSquotArtifactSnapshot artifact)].