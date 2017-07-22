Object
perform: aSelector withArguments: aCollection
	<primitive: 84>
	^ self withArgs: {aSelector. aCollection} executeMethod: (Object >> #perform:withArguments:)