paths
mapperThatMaps: aPath
	^ self allMappers
		detect: [:mapper |
			mapper mappedPaths anySatisfy: [:each |
				SquotPathUtilities path: aPath collidesWith: each]]
		ifNone: [nil]