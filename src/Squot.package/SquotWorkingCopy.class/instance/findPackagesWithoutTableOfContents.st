initialize-release
findPackagesWithoutTableOfContents
	self repository extension: #filesystem
		ifPresent: [:fs | | directory | directory := fs forVersion: self loadedHistorian version.
			self findPackagesWithoutTableOfContentsIn: directory]
		ifAbsent: [].