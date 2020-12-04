Squot-shadow
squotMaterializeWith: aMaterializer
	| mcPackage packageInfo |
	(PackageInfo squotEnvironmentInMetadata: SquotCurrentMetadata value)
	beCurrentDuring:
		[mcPackage := MCPackage named: packageName.
		MCPackageLoader new
			updatePackage: mcPackage withSnapshot: snapshot;
			loadWithNameLike: packageName.
		packageInfo := PackageInfo named: packageName.
		(SquotPackageInfoExtension of: packageInfo)
			tonelProperties: tonelProperties copy.
		^ packageInfo]