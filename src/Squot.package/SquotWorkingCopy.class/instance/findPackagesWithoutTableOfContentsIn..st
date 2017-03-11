initialize-release
findPackagesWithoutTableOfContentsIn: directoryReference
	(self packageDirectoriesIn: directoryReference) do:
		[:each | self addPackageInfoForDirectory: each at: (each relativeTo: directoryReference)].