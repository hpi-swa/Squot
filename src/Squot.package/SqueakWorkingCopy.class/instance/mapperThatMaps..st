paths
mapperThatMaps: aPath
	^ self allMappers
		detect: [:mapper | mapper mappedPathPatterns anySatisfy: [:each | each matches: aPath]]
		ifNone: [nil]