tests
testRoot
	self assert: filesystem root filesystem = filesystem.
	self assert: filesystem root path = FSPath root.
	self assert: filesystem root isRoot.