commands
wantAll: gitSignatures properties: gitProtocolProperties
"TODO:
#readPackfileResponse writes pack to file. need to unpack that file into a repository and read from there. Then answer the objects."
	writer
		sendCommand: 
				(String streamContents: [ :str |
					str nextPutAll: 'want ';
						nextPutAll: gitSignatures first;
						nextPut: self firstWantCapabilityListSeparator;
						print: gitProtocolProperties ])
		withLineTerminator: true.
	
	2 to: gitSignatures size do: [ :i |
		writer sendCommand:  'want' arguments: (gitSignatures at: i) withLineTerminator: true].
	
	self flag: 'proper negotiation phase missing...'.
	
	writer flushPacket; done.
	^ reader readPackfileResponse
	