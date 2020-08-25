applying
createVersion
	[self withUnitOfWorkActive:
		[newVersion := historian createNewVersionFromPatch: patch
			with: [:version | version
						message: message;
						author: author;
						timestamp: DateAndTime now.
					version parents: self parentVersions.
					shouldStoreMetadata ifFalse: [version doNotStoreMetadata]]]]
		on: SquotArtifactsWereCaptured
		doAndResume: [:captured | capturedArtifacts := captured artifacts].
	^ newVersion