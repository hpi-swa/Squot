private connection
isConnected
	client ifNil: [^ false] ifNotNil: [^ client isConnected]