as yet unclassified
perform: aSelector withArguments: aCollection
	^ self withArgs: {aSelector. aCollection} executeMethod: (Object >> #perform:withArguments:)