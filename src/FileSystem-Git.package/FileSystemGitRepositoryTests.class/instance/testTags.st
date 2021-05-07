tests
testTags
	self assert: repository tags isEmpty.
	
	self unitOfWork
		updateRef: 'refs/tags/tag1' 
		to: self unitOfWork head hexHash.
	self assert: repository tags size = 1.
	self assert: (repository tags includes: repository head).
	
	self unitOfWork 
		updateRef: 'refs/tags/tag2' 
		to: self unitOfWork head parents first hexHash.
	self assert: repository tags size = 2.
	self assert: (repository tags includes: repository head).
	self assert: (repository tags includes: repository head parents first)