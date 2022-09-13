testing
testWriteNew
	packedRefs readFromFile.
	packedRefs file delete.
	packedRefs writeToFile.
	self testRefs.