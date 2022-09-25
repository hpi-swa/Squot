testing
willBeLoaded
	^ SquotToggles useNewApi
		ifTrue: [self error: 'Cannot be known without the working copy']
		ifFalse: [willBeLoaded or: [self workingIsLoaded]]