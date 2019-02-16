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
			(response code caseOf: {
				[401] -> [GitRemoteAuthenticationFailed].
				[403] -> [GitRemoteAuthenticationFailed].
				[404] -> [GitRemoteResourceNotFound]
			} otherwise: [GitRemoteError]) signal: 'Could not query Git HTTP repository. Server responded: ', 
				response status
				with: response content
				remote: remote].
	(self isSmartResponse: response) ifFalse: [self fallbackToDumbProtocol].
	reader := GitProtocolReader on: response content.
	^ refs := self fetchRefsFrom: response content readStream.