as yet unclassified
connectTo: aUrl
	self flag: 'TODO: check for fallback on dumb http'.
	^ GitDumbHTTPProtocol basicNew
		initializeWith: aUrl