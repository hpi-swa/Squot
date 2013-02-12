commands
wantAll: gitSignatures capabilities: capabilities
	| contents entity|
	
	self flag: 'TODO: use streaming response'.
	
	contents := String streamContents: [ :s|
		outputStream := s.
		writer := GitProtocolWriter on: outputStream.
		writer 
			sendWantAll: gitSignatures 
			capabilities: capabilities 
			shallowLines: nil 
			depth: nil.
		
		writer flushPacket; done ].

	entity := ZnStringEntity type: ZnMimeType applicationGitUploadPackRequest.
	entity string: contents.
	
	stream :=  self clientForUploadPack
		streaming: true;
		entity: entity;
		post.
	
	reader := GitProtocolReader on: stream.
	^ reader readPackfileResponse
	