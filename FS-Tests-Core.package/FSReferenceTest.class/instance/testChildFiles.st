tests
testChildFiles
	| childFiles |
	filesystem createDirectory: '/beta'.
	filesystem createDirectory: '/gamma'.	
	(filesystem referenceTo: '/delta')
		writeStreamDo: [ :stream | stream nextPutAll: '1' ].
	(filesystem referenceTo: '/epsilon')
		writeStreamDo: [ :stream | stream nextPutAll: '2' ].
	childFiles := filesystem root files.
	self assert: childFiles size = 2.
	childFiles do: [ :each | 
		self assert: each class = FSReference.
		self assert: each isFile description: 'Collection should not contain references to directories.' ]