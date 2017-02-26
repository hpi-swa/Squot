tests
testEqual
	| other |
	other := self createFilesystem.
	self deny: filesystem = other