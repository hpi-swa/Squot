private connection
openConnection
	(stream notNil and: [ stream isConnected ])
		ifTrue: [ ^ self ].
		
	stream := SocketStream openConnectionToHostNamed: self host port: 9418.
	
	stream 
		timeout: 10 "seconds";
		binary.
	
	reader := GitProtocolReader on: stream.