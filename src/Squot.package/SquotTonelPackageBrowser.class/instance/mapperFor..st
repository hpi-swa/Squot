accessing
mapperFor: aString
	^ self mappers detect: [:each | each package name = aString] ifNone: [nil]