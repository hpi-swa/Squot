private
invokeReceivePackWithRefs: aDictionary
	| request response |
	request := self client requestWithUrl: (self urlForService: 'git-receive-pack').
	request contentType: 'application/x-git-receive-pack-request'.
	
	response := self client sendRequest: request contentBlock: [:requestStream |
		writer := GitProtocolWriter on: requestStream.
		writer writeUpdateReferences: aDictionary previousReferences: refs.
		writer flushPacket.
		requestStream flush].
	response isSuccess ifFalse: [Error signal: response status].