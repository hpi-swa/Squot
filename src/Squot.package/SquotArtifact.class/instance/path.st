accessing
path
	^ SquotToggles useNewApi
		ifTrue: [storeInfo at: 'path' ifAbsent: [path "fallback for old objects"]]
		ifFalse: [path]