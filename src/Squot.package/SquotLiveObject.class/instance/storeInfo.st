accessing
storeInfo
	store activateObjectRegistryDuring:
	[^ storeInfo copy
		in: [:copy | object squotRemoveTransientStoreInfoFrom: copy];
		yourself]