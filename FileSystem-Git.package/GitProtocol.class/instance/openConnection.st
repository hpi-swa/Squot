accessing
openConnection
	(stream notNil and: [ stream isConnected ])
		ifTrue: [ ^ self ].
		
	stream := SocketStream openConnectionToHostNamed: self host port: 9418.
	
	stream 
		timeout: 60 "seconds";
		binary.