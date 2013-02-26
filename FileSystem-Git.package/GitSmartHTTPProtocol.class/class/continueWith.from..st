instance creation
continueWith: initialResponse from: aUrl
	^ (self connectTo: aUrl)
		continueWith: initialResponse