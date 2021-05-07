copying
copyWithDiffApplied: aDiff
	^ self shallowCopy
		setContent: (aDiff applyContentDiffTo: self content)
		storeInfo: (aDiff applyMetadataDiffTo: self storeInfo);
		yourself