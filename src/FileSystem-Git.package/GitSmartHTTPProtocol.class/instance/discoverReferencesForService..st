private
discoverReferencesForService: aServiceName
	| response |
	response := self initialRequestTo: self url withService: aServiceName.
	response isSuccess
		ifFalse: [
			(response code = 401 and: [credentials isNil and: [self requestCredentials]])
				ifTrue: ["try again with credentials"
					self applyCredentials.
					^ self discoverReferencesForService: aServiceName].
			GitRemoteAuthenticationFailed signal: 'Could not query Git HTTP repository. Server responded: ', 
				response status with: response content].
	(self isSmartResponse: response) ifFalse: [self fallbackToDumbProtocol].
	reader := GitProtocolReader on: response content.
	^ refs := self fetchRefsFrom: response content readStream.