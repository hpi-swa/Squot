creating new versions
newSaveOperation
	^ SquotSaveOperation new
		workingCopy: self;
		historian: self loadedHistorian;
		additionalParentVersions: self additionalParents;
		message: self newVersionMessage;
		shouldStoreMetadata: self shouldStoreMetadata;
		workingCopySnapshot: self snapshot;
		yourself