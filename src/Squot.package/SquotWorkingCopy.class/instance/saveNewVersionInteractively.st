creating new versions
saveNewVersionInteractively
	| snapshotBuilder loadedSnapshot baseSnapshot selectedChanges tool finalSnapshot newVersion |
	self flag: #optimize. "snapshotting and diffing"
	tool := SquotSaveVersionDialog new
		parentVersions: self parentVersions;
		originalArtifacts: (baseSnapshot := self baseSnapshot);
		proposeArtifacts: (loadedSnapshot := store captureSnapshot);
		controllerForIgnores: self;
		yourself.
	ToolBuilder default in: [:builder | | view |
		view := builder open: tool label: 'Select new version changes and message'.
		builder runModal: view].
	tool accepted ifFalse: [^ nil].
	selectedChanges := tool selectedChanges.
	snapshotBuilder := baseSnapshot createNewBuilder.
	selectedChanges do: [:each | snapshotBuilder add: each].
	finalSnapshot := snapshotBuilder buildSnapshot.
	newVersion := loadedHistorian createNewVersion: finalSnapshot
		with: [:version | version
					message: tool message asString;
					author: self defaultAuthor.
				self shouldNotStoreMetadata ifTrue: [version doNotStoreMetadata]].
	previousSnapshot := finalSnapshot.
	previousVersionId := newVersion internalId.
	self cacheNewMonticelloVersions: finalSnapshot message: tool message.