creating new versions
newSaveOperation
	^ SquotSaveOperation new
		workingCopy: self;
		historian: self loadedHistorian;
		additionalParentVersions: self additionalParents;
		message: self newVersionMessage;
		author: self defaultAuthor;
		committer: self defaultAuthor;
		shouldStoreMetadata: self shouldStoreMetadata;
		yourself