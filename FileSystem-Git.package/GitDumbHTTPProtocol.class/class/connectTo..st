instance creation
connectTo: aUrl
	| client |
	client := self initialRequestTo: aUrl.
	^ ((self isSmartResponse: client response)
				ifTrue: [ GitSmartHTTPProtocol ]
				ifFalse: [ self ])
			continueWith: client from: aUrl