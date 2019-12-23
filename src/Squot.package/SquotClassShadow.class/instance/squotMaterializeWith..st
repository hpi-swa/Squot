Squot-shadow
squotMaterializeWith: aMaterializer
	| className |
	(PackageInfo squotEnvironmentInMetadata: SquotCurrentMetadata value)
	beCurrentDuring:
		[className := (snapshot definitions detect: #isClassDefinition) name.
		MCPackageLoader new
			installSnapshot: snapshot;
			loadWithNameLike: className.
		^ Environment current at: className]