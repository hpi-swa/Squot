metadata-loading-legacy
legacySquotClassMappings
	^ Dictionary newFrom: {
		#SquotTrackedObjectMetadata -> Dictionary.
	}, ((GSMapper withAllSubclasses copyWith: GSMetadata)
		collect: [:each | self legacySquotClassMapping: each])