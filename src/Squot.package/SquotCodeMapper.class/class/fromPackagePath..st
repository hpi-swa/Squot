instance creation
fromPackagePath: aPath
	^ self
		package: (MCPackage named: (self packageNameFromPackagePath: aPath))
		path: aPath parent