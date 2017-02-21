accessing
mergeStoreInfo: otherStoreInfo
	otherStoreInfo keysAndValuesDo: [:key :value | storeInfo at: key put: value].