instance creation
connectTo: aUrl
	| response client |
	client := WebClient new.
	response := self initialRequestTo: aUrl with: client.
	^ ((self isSmartResponse: response)
				ifTrue: [ GitSmartHTTPProtocol ]
				ifFalse: [ self ])
			continueWith: client from: aUrl content: response content