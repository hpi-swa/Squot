creating new versions
saveNewVersionFromPatch: aPatch ifCanceled: cancelBlock
	| selectedPatch message newVersion capturedArtifacts |
	self flag: #TODO. "Create new signal for this?"
	(SquotSelectionOfChangesRequested new
		patch: aPatch;
		title: '';
		signal)
	ifNotNil: [:signalSelectedPatch | 
		selectedPatch := signalSelectedPatch.
		message := SquotInitialLogMessageRequested new signal ifNil: 'Empty commit message'.]
	ifNil: [| tool |
		tool := (SquotSaveVersionDialog on: aPatch)
			parentVersions: self parentVersions;
			controllerForIgnores: self;
			yourself.
		tool requestSelectedChangesWithTitle: 'Select changes and message for the new version'.
		tool accepted ifFalse: [^ cancelBlock value].
		selectedPatch := tool selectedPatch.
		message := tool message.].
	[self handlePathChangesDuring:
		[newVersion := loadedHistorian createNewVersionFromPatch: selectedPatch
			with: [:version | version
						message: message asString;
						author: self defaultAuthor.
					version parents: self parentVersions.
					self shouldNotStoreMetadata ifTrue: [version doNotStoreMetadata]]]]
		on: SquotArtifactsWereCaptured
		doAndResume: [:captured | capturedArtifacts := captured artifacts].
	self loadedVersion: newVersion.
	self cacheSavedArtifacts: (capturedArtifacts ifNil: [Dictionary new]).
	self resetAdditionalParents.
	previousSnapshot := nil.
	previousVersionId := newVersion internalId.
	self cacheNewMonticelloVersions: selectedPatch message: message.