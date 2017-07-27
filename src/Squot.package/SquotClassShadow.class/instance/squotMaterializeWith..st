Squot-shadow
squotMaterializeWith: aMaterializer
	| className |
	className := (snapshot definitions detect: #isClassDefinition) name.
	MCPackageLoader new
		installSnapshot: snapshot;
		loadWithNameLike: className.
	^ Environment current at: className