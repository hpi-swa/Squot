creating new versions
saveNewVersionInteractively
	| baseVersion patch selectedPatch tool newVersion |
	baseVersion := self baseVersion.
	baseVersion ifNotNil: [self addGlobalObjectsToStore: baseVersion].
	patch := self lazySnapshot patchRelativeToBase: baseVersion.
	tool := SquotSaveVersionDialog new
		parentVersions: self parentVersions;
		patch: patch;
		controllerForIgnores: self;
		yourself.
	tool requestSelectedChangesWithTitle: 'Select changes and message for the new version'.
	tool accepted ifFalse: [^ nil].
	selectedPatch := tool selectedPatch.
	newVersion := loadedHistorian createNewVersionFromPatch: selectedPatch
		with: [:version | version
					message: tool message asString;
					author: self defaultAuthor.
				version parents: self parentVersions.
				self shouldNotStoreMetadata ifTrue: [version doNotStoreMetadata]].
	self loadedVersion: newVersion.
	self resetAdditionalParents.
	previousSnapshot := nil.
	previousVersionId := newVersion internalId.
	self cacheNewMonticelloVersions: selectedPatch message: tool message.