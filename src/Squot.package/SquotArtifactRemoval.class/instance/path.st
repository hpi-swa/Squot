accessing
path
	SquotToggles useNewApi ifFalse: [^ super path].
	^ left storeInfo at: 'path'