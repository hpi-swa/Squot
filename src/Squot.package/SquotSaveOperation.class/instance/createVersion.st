applying
createVersion
	self withUnitOfWorkActive:
		[newVersion := historian createNewVersionFromPatch: patch
			with: [:version | version
						message: message;
						author: author;
						timestamp: self timestamp.
					version parents: self parentVersions.
					shouldStoreMetadata ifFalse: [version doNotStoreMetadata]]].
	^ newVersion