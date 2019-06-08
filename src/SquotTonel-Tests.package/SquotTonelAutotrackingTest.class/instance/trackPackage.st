as yet unclassified
trackPackage
	workingCopy addPackageNamed: package name at: 'src'.
	(workingCopy artifactAt: self packagePath) serializer: SquotTonelSerializer.