instance creation
continueWith: initialResponse from: aUrl
	^ (super connectTo: aUrl)
		continueWith: initialResponse