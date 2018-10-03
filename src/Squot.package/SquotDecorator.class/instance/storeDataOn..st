Object
storeDataOn: aDataStream
	^ self withArgs: {aDataStream} executeMethod: (Object >> #storeDataOn:)