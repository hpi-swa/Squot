copying
copyWithDiffApplied: aDiff
	| copy |
	copy := self shallowCopy
		setContent: (aDiff applyContentDiffTo: self content)
		storeInfo: (aDiff applyMetadataDiffTo: self storeInfo);
		yourself.
	copy storeInfo at: #id put: copy id. "storeInfo id must match the inst var id."
	^ copy