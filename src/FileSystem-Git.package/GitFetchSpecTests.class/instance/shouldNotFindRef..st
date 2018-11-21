testing
shouldNotFindRef: aBlock
	self assert: aBlock value isNil description: 'no ref should be found'.