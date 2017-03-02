tests
testRoot
	self assert: filesystem root filesystem = filesystem.
	self assert: filesystem root path = Path root.
	self assert: filesystem root isRoot.