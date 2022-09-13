initialize-release
initialize
	id := self class newId.
	storeInfo := SquotTrackedObjectMetadata new.
	storeInfo at: #id put: id.