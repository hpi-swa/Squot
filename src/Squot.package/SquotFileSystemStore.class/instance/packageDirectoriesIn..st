private package finding
packageDirectoriesIn: directoryReference
	^ SquotArtifactLocatorRegistry current
		locateArtifactsForClass: PackageInfo in: directoryReference