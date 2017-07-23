accessing
storeInfo
	storeInfo ifEmpty: [storeInfoBlock value].
	storeInfo ifNotEmpty: [storeInfoBlock := nil].
	^ storeInfo