Object
storeDataOn: aDataStream
	self logStoreDataOn.
	^ self withArgs: {aDataStream} executeMethod: (Object >> #storeDataOn:)