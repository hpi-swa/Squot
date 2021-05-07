as yet unclassified
trackPackage
	workingCopy addPackageNamed: package name at: 'src/', package name.
	(workingCopy artifactAt: self packagePath) serializer: SquotTonelSerializer.