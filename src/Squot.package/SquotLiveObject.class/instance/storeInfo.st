accessing
storeInfo
	^ storeInfo copy
		in: [:copy | object squotRemoveTransientStoreInfoFrom: copy];
		yourself