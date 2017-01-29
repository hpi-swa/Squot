initialize-release
initializeDefaultStoreInfoFor: anObject
	storeInfo at: #objectClassName put: anObject class name.
	storeInfo at: #serializer put: anObject squotPreferredSerializer name.
	storeInfo at: #loader put: anObject squotPreferredLoader name.