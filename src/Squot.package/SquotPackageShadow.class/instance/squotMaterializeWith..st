Squot-shadow
squotMaterializeWith: aMaterializer
	| mcPackage |
	mcPackage := MCPackage named: packageName.
	MCPackageLoader new
		updatePackage: mcPackage withSnapshot: snapshot;
		loadWithNameLike: packageName.
	^ PackageInfo named: packageName