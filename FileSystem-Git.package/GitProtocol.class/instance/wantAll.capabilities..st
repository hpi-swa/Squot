commands
wantAll: gitSignatures capabilities: capabilities
"TODO:
#readPackfileResponse writes pack to file. need to unpack that file into a repository and read from there. Then answer the objects."
	writer sendWantAll: gitSignatures capabilities: capabilities.
	
	self flag: 'proper negotiation phase missing...'.
	
	writer flushPacket; done.
	^ reader readPackfileResponse
	