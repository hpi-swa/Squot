as yet unclassified
wantAll: gitSignatures properties: gitProtocolProperties
"TODO:
#readPackfileResponse writes pack to file. need to unpack that file into a repository and read from there. Then answer the objects."
	self sendCommand: 
		(String streamContents: [ :str |
			str nextPutAll: 'want ';
				nextPutAll: gitSignatures first;
				nextPut: self firstWantCapabilityListSeparator;
				print: gitProtocolProperties ]).
	
	2 to: gitSignatures size do: [ :i |
		self sendCommand:  'want ', (gitSignatures at: i) ].
	
	self flushPacket; done.
	^ self readPackfileResponse
	