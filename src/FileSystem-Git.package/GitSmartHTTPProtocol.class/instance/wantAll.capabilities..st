commands
wantAll: gitSignatures capabilities: capabilities
	| contents response |
	
	contents := String streamContents: [ :s|
		outputStream := s.
		writer := GitProtocolWriter on: outputStream.
		writer 
			writeWantAll: gitSignatures 
			capabilities: capabilities 
			shallowLines: nil 
			depth: nil.
		
		writer flushPacket; done ].

	response := self postForUploadPack: contents.
	response stream binary.
	^ (GitProtocolReader on: response contentStream) readPackfileResponse
	