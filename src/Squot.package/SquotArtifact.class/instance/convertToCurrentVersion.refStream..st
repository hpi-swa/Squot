update migration
convertToCurrentVersion: varDict refStream: smartRefStrm
	"Upgrade storeInfo to SquotTrackedObjectMetadata"
	(storeInfo isKindOf: SquotTrackedObjectMetadata) ifFalse:
		[storeInfo := SquotTrackedObjectMetadata newFrom: storeInfo].