private connection
withOpenConnection: aBlock
	self openConnection.
	aBlock
		ensure: [ self closeConnection ]