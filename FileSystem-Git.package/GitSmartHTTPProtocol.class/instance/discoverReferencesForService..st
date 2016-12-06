private
discoverReferencesForService: aServiceName
	| response |
	response := self initialRequestTo: self url withService: aServiceName.
	response isSuccess
		ifFalse: [Error signal: 'Could not query Git HTTP repository. Server responded: ', 
			response status].
	(self isSmartResponse: response) ifFalse: [self fallbackToDumbProtocol].
	reader := GitProtocolReader on: response content.
	^ refs := self fetchRefsFrom: response content readStream.