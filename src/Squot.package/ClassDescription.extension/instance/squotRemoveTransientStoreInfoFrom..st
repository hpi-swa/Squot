*Squot-trackable
squotRemoveTransientStoreInfoFrom: aDictionary
	super squotRemoveTransientStoreInfoFrom: aDictionary.
	aDictionary removeKey: #environment ifAbsent: [].