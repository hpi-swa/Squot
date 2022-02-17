accessing
storeInfo
	| evaluated |
	storeInfo ifEmpty: [evaluated := storeInfoBlock value].
	storeInfo
		ifNotEmpty: [storeInfoBlock := nil] "The block populated the info as a side effect."
		ifEmpty: [storeInfo := evaluated]. "The block only evaluated to the info."
	^ storeInfo