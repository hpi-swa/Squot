initialize-release
initializeDefaultStoreInfoFor: anObject
	storeInfo at: #objectClassName put: anObject class name.
	storeInfo at: #serializer put: anObject squotPreferredSerializer name.
	anObject squotPreferredLoader
		ifNotNil: [:loader | storeInfo at: #loader put: loader name].