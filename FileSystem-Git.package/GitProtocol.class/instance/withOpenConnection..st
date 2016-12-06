private connection
withOpenConnection: aBlock
	self isConnected ifTrue: [^ aBlock value].
	self openConnection.
	aBlock
		ensure: [ self closeConnection ]