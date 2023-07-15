converting
packageName
	^ SquotToggles useNewApi
		ifTrue: [(storeInfo firstReferenceOfType: 'package') value at: 'packageName']
		ifFalse: [self shadowOfTrackedObject packageName]