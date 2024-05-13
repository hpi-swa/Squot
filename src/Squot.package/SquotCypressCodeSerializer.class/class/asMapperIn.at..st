mapper-importing
asMapperIn: aFilesystem at: aPath
	| packagePath |
	packagePath := aPath parent.
	^ SquotCypressMapper
		package: (MCPackage named: packagePath base)
		path: packagePath parent