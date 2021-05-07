tests
testReadingPackedTag
	| loadedObject unitOfWork |
	self usePackWithTag.
	repository withUnitOfWork:
	[unitOfWork := repository unitOfWork.
	loadedObject := unitOfWork objectNamed: '25f43f451071dd8a6cf39accd5070d885de4b017'.
	self assert: GitTag equals: loadedObject class.
	
	self assert: 1 equals: unitOfWork tags size]