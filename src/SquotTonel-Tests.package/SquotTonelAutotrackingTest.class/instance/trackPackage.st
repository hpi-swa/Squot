as yet unclassified
trackPackage
	path := 'src/', package name.
	workingCopy addPackageNamed: package name at: path.
	(workingCopy artifactAt: self packagePath) serializer: SquotTonelSerializer.