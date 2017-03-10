initialize-release
findPackagesWithoutTableOfContentsIn: directoryReference
	| repositoryDirectory |
	repositoryDirectory := self findDirectoryWithPackages: directoryReference ifNone: [^ self].
	repositoryDirectory directories
		select: [:each | each basename endsWith: '.package']
		thenDo: [:each | self addPackageInfoForDirectory: each at: (each relativeTo: directoryReference)].