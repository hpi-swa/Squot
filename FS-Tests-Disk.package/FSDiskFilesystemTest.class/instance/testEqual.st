tests
testEqual
	| other |
	other := self createFilesystem.
	self assert: filesystem = other