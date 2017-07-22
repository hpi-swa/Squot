as yet unclassified
objectNamed: name
	^ self value
		ifNil: [NotFound signal: name]
		ifNotNil: [:registry | registry objectNamed: name]