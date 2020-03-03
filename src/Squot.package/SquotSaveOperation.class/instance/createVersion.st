applying
createVersion
	[self workingCopy handlePathChangesDuring: 
		[self withUnitOfWork:
			[newVersion := historian createNewVersionFromPatch: patch
				with: [:version | version
							message: message;
							author: author.
						version parents: self parentVersions.
						shouldStoreMetadata ifFalse: [version doNotStoreMetadata]]]]]
		on: SquotArtifactsWereCaptured
		doAndResume: [:captured | capturedArtifacts := captured artifacts].
	^ newVersion