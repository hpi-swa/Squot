converting
packageName
	^ SquotToggles useNewApi
		ifTrue: [(storeInfo references detect: [:each | (each at: 'type') = 'package']) at: 'packageName']
		ifFalse: [self shadowOfTrackedObject packageName]