accessing
path: aString
	| oldPath |
	SquotToggles useNewApi
		ifTrue:
			[storeInfo at: 'path' put: aString]
		ifFalse:
			[oldPath := path.
			path := aString].