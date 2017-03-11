private
packageDirectoriesIn: directoryReference
	| repositoryDirectory |
	repositoryDirectory := self findDirectoryWithPackages: directoryReference ifNone: [^ self].
	^ repositoryDirectory directories
		select: [:each | each basename endsWith: '.package']