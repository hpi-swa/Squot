mapper-importing
asMapperFromReference: aReference
	| packagePath |
	packagePath := aReference path parent.
	^ SquotTonelMapper
		package: (MCPackage named: packagePath basename)
		path: packagePath parent