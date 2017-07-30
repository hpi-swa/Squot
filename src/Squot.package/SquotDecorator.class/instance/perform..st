Object
perform: aSelector
	<primitive: 83>
	^ self withArgs: {aSelector} executeMethod: (Object >> #perform:)