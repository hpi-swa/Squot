private creating new versions
saveNewVersionFromPatch: aPatch message: aString
	"Create a new version with the given message."
	| newVersion capturedArtifacts |
	[self handlePathChangesDuring:
		[newVersion := loadedHistorian createNewVersionFromPatch: aPatch
			with: [:version | version
						message: aString;
						author: self defaultAuthor.
					version parents: self parentVersions.
					self shouldNotStoreMetadata ifTrue: [version doNotStoreMetadata]]]]
	on: SquotArtifactsWereCaptured
	doAndResume: [:captured | capturedArtifacts := captured artifacts].
	self loadedVersion: newVersion.
	self cacheSavedArtifacts: (capturedArtifacts ifNil: [Dictionary new]).
	self resetAdditionalParents.
	^ newVersion