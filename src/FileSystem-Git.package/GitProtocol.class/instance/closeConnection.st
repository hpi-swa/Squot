private connection
closeConnection
	self isConnected
		ifTrue: [writer flushPacket.
				stream close.
				stream := nil]