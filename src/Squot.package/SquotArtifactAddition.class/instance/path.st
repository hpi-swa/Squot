accessing
path
	SquotToggles useNewApi ifFalse: [^ super path].
	^ right storeInfo at: 'path' ifAbsent: [right storeInfo at: #id]