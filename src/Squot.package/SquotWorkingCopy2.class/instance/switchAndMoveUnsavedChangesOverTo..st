ancestry
switchAndMoveUnsavedChangesOverTo: aHistorian
	| oldHistorian leavingVersion leavingVersionSnapshot tempHistorian unsavedChanges newVersion newVersionSnapshot newArtifacts mySnapshot merge shouldRestoreUnsavedChanges |
	"Quick win: " (self activeHistorian version = aHistorian version and: [(repository hasTemporaryVersionsOn: aHistorian) not])
		ifTrue: "Nothing needs to be modified in the stores."
			[activeHistorian := aHistorian.
			^ self].
	"Save changes to historian that we are leaving"
	self flag: #todo. "progress notifications"
	self flag: #duplication. "with switchTo:"
	oldHistorian := self activeHistorian.
	leavingVersion := oldHistorian version.
	leavingVersionSnapshot := leavingVersion snapshot.
	tempHistorian := repository historianForTemporaryVersionsOn: oldHistorian.
	tempHistorian version: leavingVersion.
	activeHistorian := tempHistorian.
	[self saveVersionWithMessage: 'Unsaved changes on ', oldHistorian shortName]
	ensure: [activeHistorian := oldHistorian].
	"Load objects from the latest version"
	newVersion := aHistorian version.
	"The other branch may have packages that are already loaded (and changed)"
	newVersionSnapshot := newVersion snapshot.
	newVersionSnapshot artifacts do: [:each | self addIfAlreadyLoaded: each].
	self updateLoadOrderFromVersion: newVersion.
	mySnapshot := SquotProjectSnapshot fromStore: self.
	unsavedChanges := mySnapshot patchRelativeToBase: leavingVersionSnapshot.
	self flag: #optimize. "Use cached snapshots from the baseVersion from the last save"
	"Snapshot the added artifacts"
	self flag: #todo. "What about unsaved removals of artifacts? Such artifacts are currently tracked again after the switch if they are present in the newVersion."
	newArtifacts := project artifacts reject: [:each | leavingVersionSnapshot project includesArtifactWithId: each id].
	"Load other branch. Overwrite the added pacakges at first. They will be restored when the unsavedChanges are merged back later."
	activeHistorian := aHistorian.
	self applyMerge: (newVersionSnapshot patchRelativeToBase: mySnapshot).
	"Note: the line above may invalidate some snapshots in mySnapshot. That's why we must create a new one further down."
	self loadedVersion: newVersion.
	"Merge back saved changes from new historian"
	(repository hasTemporaryVersionsOn: aHistorian) ifTrue:
		[tempHistorian := repository historianForTemporaryVersionsOn: aHistorian.
		merge := (SquotProjectSnapshot fromStore: self) squotMergeWith: tempHistorian version snapshot basedOn: tempHistorian version parents first snapshot.
		merge hasConflicts
			ifTrue:
				[| mergeRequest |
				mergeRequest := SquotMergeRequested new
					merge: merge;
					title: 'Merge conflicts with stashed changes on new branch';
					signal;
					yourself.
				mergeRequest wasHandled ifFalse:
					[| tool | tool := SquotMergeTool on: merge.
					[tool workingCopy: self;
						controllerForIgnores: self;
						requestSelectedChangesWithTitle: 'Merge conflicts with stashed changes on new branch'.
					tool accepted or: [self confirm: 'Discard stashed changes of the branch?']] whileFalse].
				self applyMerge: merge]
			ifFalse: [self applyMerge: merge]].
	"Restore unsaved changes that are supposed to be moved over"
	shouldRestoreUnsavedChanges := true.
	merge := (SquotProjectSnapshot fromStore: self) squotMergeWith: unsavedChanges incoming basedOn: unsavedChanges working.
	merge hasConflicts ifTrue:
		[| mergeRequest |
		mergeRequest := SquotMergeRequested new
			merge: merge;
			title: 'Merge conflicts with unsaved changes';
			signal;
			yourself.
		mergeRequest wasHandled ifFalse:
			[| tool | tool := SquotMergeTool on: merge.
			[tool workingCopy: self;
				controllerForIgnores: self;
				requestSelectedChangesWithTitle: 'Merge conflicts with unsaved changes'.
			tool accepted or: [self confirm: 'Leave previously unsaved changes on the branch from which you switched away?']] whileFalse.
			shouldRestoreUnsavedChanges := tool accepted]].
	shouldRestoreUnsavedChanges ifTrue:
		[self applyMerge: merge.
		repository delete: (repository historianForTemporaryVersionsOn: oldHistorian) "These changes were moved over"].