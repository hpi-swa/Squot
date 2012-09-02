tests
testReadingPackedTag
	| loadedObject |
	self usePackWithTag.
	loadedObject := repository objectNamed: '25f43f451071dd8a6cf39accd5070d885de4b017'.
	self assert: GitTag equals: loadedObject class.
	
	self assert: 1 equals: repository tags size