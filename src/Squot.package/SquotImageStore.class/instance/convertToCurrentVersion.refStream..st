update migration
convertToCurrentVersion: varDict refStream: smartRefStrm
	"Upgrade additionalInfo to SquotTrackedObjectMetadata"
	additionalInfo keys do: [:each | | metadata |
		metadata := additionalInfo at: each.
		(metadata isKindOf: SquotTrackedObjectMetadata) ifFalse:
			[additionalInfo at: each put: (SquotTrackedObjectMetadata newFrom: metadata)]].