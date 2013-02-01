private connection
openConnection
	| tempStream |
	self isConnected
		ifTrue: [ ^ self ].
		
	"Use tempStream to ensure that 'stream' is only set when everything is ok"
	tempStream := SocketStream openConnectionToHostNamed: self host port: 9418.
	
	tempStream 
		timeout: 10 "seconds";
		binary.

	stream := tempStream.
	reader := GitProtocolReader on: stream.
	writer := GitProtocolWriter on: stream.
	