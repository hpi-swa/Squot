accessing
id
	^ id ifNil: [self storeInfo at: #id ifAbsent: []]