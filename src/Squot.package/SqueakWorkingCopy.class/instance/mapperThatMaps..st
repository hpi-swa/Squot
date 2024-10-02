paths
mapperThatMaps: aPath
	^ self allMappers
		detect: [:mapper | SquotPathUtilities path: aPath collidesWithAnyOf: mapper mappedPaths]
		ifNone: [nil]