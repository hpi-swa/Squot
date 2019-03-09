accessing
storeInfo
	| evaluated |
	storeInfo ifEmpty: [evaluated := storeInfoBlock value].
	storeInfo
		ifNotEmpty: [storeInfoBlock := nil]
		ifEmpty: [storeInfo := evaluated].
	^ storeInfo