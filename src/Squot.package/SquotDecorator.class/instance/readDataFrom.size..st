Object
readDataFrom: aDataStream size: varsOnDisk
	^ self withArgs: {aDataStream. varsOnDisk}
		executeMethod: (Object >> #readDataFrom:size:)