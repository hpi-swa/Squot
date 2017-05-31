creating new versions
saveNewVersionInteractivelyIfCanceled: cancelBlock
	| patch selectedPatch tool newVersion capturedArtifacts |
	patch := self lazySnapshot patchRelativeToBase: self baseSnapshot.
	tool := SquotSaveVersionDialog new
		parentVersions: self parentVersions;
		patch: patch;
		controllerForIgnores: self;
		yourself.
	tool requestSelectedChangesWithTitle: 'Select changes and message for the new version'.
	tool accepted ifFalse: [^ cancelBlock value].
	selectedPatch := tool selectedPatch.
	[newVersion := loadedHistorian createNewVersionFromPatch: selectedPatch
		with: [:version | version
					message: tool message asString;
					author: self defaultAuthor.
				version parents: self parentVersions.
				self shouldNotStoreMetadata ifTrue: [version doNotStoreMetadata]]]
		on: SquotArtifactsWereCaptured
		doAndResume: [:captured | capturedArtifacts := captured artifacts].
	self loadedVersion: newVersion.
	self cacheSavedArtifacts: (capturedArtifacts ifNil: [Dictionary new]).
	self resetAdditionalParents.
	previousSnapshot := nil.
	previousVersionId := newVersion internalId.
	self cacheNewMonticelloVersions: selectedPatch message: tool message.