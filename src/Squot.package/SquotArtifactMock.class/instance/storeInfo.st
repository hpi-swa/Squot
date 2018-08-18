accessing
storeInfo

	^ storeInfo ifNil: [storeInfo := SquotTrackedObjectMetadata new]