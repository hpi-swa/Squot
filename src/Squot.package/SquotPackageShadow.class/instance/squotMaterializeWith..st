Squot-shadow
squotMaterializeWith: aMaterializer
	| mcPackage |
	(PackageInfo squotEnvironmentInMetadata: SquotCurrentMetadata value)
	beCurrentDuring:
		[mcPackage := MCPackage named: packageName.
		MCPackageLoader new
			updatePackage: mcPackage withSnapshot: snapshot;
			loadWithNameLike: packageName.
		^ PackageInfo named: packageName]