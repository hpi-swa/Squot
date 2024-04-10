*Squot-Mapper-importing
asMapperIn: aFilesystem at: aPath
	| packagePath |
	packagePath := aPath parent.
	^ SquotTonelMapper
		package: (MCPackage named: packagePath basename)
		path: packagePath parent