accessing
openConnection
	(stream notNil and: [ stream isConnected ])
		ifTrue: [ ^ self ].
		
	stream := SocketStream openConnectionToHostNamed: self host port: 9418.
	"20 seconds timeout"
	stream timeout: 60.