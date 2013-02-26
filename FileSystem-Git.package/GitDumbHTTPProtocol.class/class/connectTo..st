instance creation
connectTo: aUrl
	| initialResponse |
	initialResponse := (self initialRequestTo: aUrl) response.
	^ ((self isSmartResponse: initialResponse)
			ifTrue: [GitSmartHTTPProtocol]
			ifFalse: [self])
		continueWith: initialResponse from: aUrl 