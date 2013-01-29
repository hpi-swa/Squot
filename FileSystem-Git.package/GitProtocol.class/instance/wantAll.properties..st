commands
wantAll: gitSignatures properties: gitProtocolProperties
"TODO:
#readPackfileResponse writes pack to file. need to unpack that file into a repository and read from there. Then answer the objects."
	self sendCommand: 
		(String streamContents: [ :stream|
			stream << 'want ' << gitSignatures first.
			stream space print: gitProtocolProperties ]).
	
	2 to: gitSignatures size do: [ :i|
		self sendCommand:  'want ', (gitSignatures at: i) ].
	
	self flushPacket; done.
	^ self readPackfileResponse
	