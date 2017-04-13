private package finding
packageDirectoriesIn: directoryReference
	| repositoryDirectory |
	repositoryDirectory := self findDirectoryWithPackages: directoryReference
		ifNone: [^ Array empty].
	^ repositoryDirectory directories
		select: [:each | each basename endsWith: '.package']