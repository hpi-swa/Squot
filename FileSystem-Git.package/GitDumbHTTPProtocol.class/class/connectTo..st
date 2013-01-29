as yet unclassified
connectTo: aUrl
	^ (self isSmartRepository: aUrl)
		ifTrue: [GitSmartHTTPProtocol connectTo: aUrl ]
		ifFalse: [super connectTo: aUrl  ]