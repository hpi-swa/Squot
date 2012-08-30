as yet unclassified
connectTo: aUrl
	self flag: 'TODO: check for fallback on dumb http'.
	^ GitDumbHtppProtocol basicNew
		initializeWith: aUrl