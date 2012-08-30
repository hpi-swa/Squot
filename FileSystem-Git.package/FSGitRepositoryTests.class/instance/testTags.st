commit tests
testTags
	self assert: repository tags isEmpty.
	
	basicRepository 
		updateRef: basicRepository tagsDir / 'tag1' 
		to: basicRepository head signature.
	self assert: repository tags size = 1.
	self assert: (repository tags includes: repository head).
	
	basicRepository 
		updateRef: basicRepository tagsDir / 'tag2' 
		to: basicRepository head parents first signature.
	self assert: repository tags size = 2.
	self assert: (repository tags includes: repository head).
	self assert: (repository tags includes: repository head parents first)