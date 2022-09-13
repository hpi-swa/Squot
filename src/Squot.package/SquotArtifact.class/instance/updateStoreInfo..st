accessing
updateStoreInfo: otherStoreInfo
	storeInfo updateFrom: otherStoreInfo.
	id ifNil: [id := storeInfo at: #id ifAbsent: []].