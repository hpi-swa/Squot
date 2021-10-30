as yet unclassified
objectNamed: name
	^ self value
		ifNil: [(NotFound object: name) signal]
		ifNotNil: [:registry | registry objectNamed: name]