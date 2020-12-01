as yet unclassified
objectNamed: name
	^ self value
		ifNil: [NotFound signalFor: name]
		ifNotNil: [:registry | registry objectNamed: name]