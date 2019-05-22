*Squot-trackable
squotAllSerializers
	| serializerFactories |
	serializerFactories := OrderedCollection new.
	(Pragma
		allNamed: #squotSerializer:priority: 
		from: self class
		to: Object class
		sortedByArgument: 2)
		do: [:each | serializerFactories add: (self perform: each selector)].
	^ serializerFactories