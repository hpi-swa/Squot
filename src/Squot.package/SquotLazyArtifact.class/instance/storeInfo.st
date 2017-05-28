accessing
storeInfo
	storeInfo ifEmpty: [storeInfoBlock value].
	^ storeInfo