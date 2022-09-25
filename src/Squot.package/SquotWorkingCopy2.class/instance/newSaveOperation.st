private
newSaveOperation
	^ SquotSaveOperation new
		workingCopy: self;
		historian: activeHistorian;
		additionalParentVersions: additionalParentVersions;
		message: newVersionMessage;
		shouldStoreMetadata: (project metadata at: 'storeMetadata' ifAbsent: [true]);
		workingCopySnapshot: self snapshot;
		yourself