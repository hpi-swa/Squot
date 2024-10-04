mapper-importing
asMapperFromReference: aReference
	| packagePath |
	packagePath := aReference path parent.
	^ SquotCypressMapper
		package: (MCPackage named: packagePath base)
		path: packagePath parent