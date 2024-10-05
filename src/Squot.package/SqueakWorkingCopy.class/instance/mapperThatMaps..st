paths
mapperThatMaps: aPath
	^ self allMappers
		detect: [:mapper | mapper maps: aPath]
		ifNone: [nil]