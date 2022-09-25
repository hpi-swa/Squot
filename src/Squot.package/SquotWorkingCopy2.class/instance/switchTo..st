ancestry
switchTo: aHistorian
	| oldHistorian leavingVersion leavingVersionSnapshot tempHistorian unsavedChanges newVersion newVersionSnapshot newArtifacts mySnapshot mixedProject mixedSnapshotStore finalSnapshotStore merge |
	"Save changes to historian that we are leaving"
	self flag: #todo. "progress notifications"
	oldHistorian := self activeHistorian.
	leavingVersion := oldHistorian version.
	leavingVersionSnapshot := leavingVersion snapshot.
	tempHistorian := repository historianForTemporaryVersionsOn: oldHistorian.
	unsavedChanges := self patchRelativeToBase: leavingVersionSnapshot.
	self flag: #optimize. "Use cached snapshots from the baseVersion from the last save"
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
	newArtifacts := project artifacts reject: [:each | leavingVersionSnapshot project includesArtifactWithId: each id].
	activeHistorian := aHistorian.
	"Load other branch. First without the added packages..."
	mixedProject := newVersionSnapshot project copy.
	newArtifacts do: [:each | mixedProject putArtifact: each].
	mySnapshot := SquotProjectSnapshot fromStore: self.
	mixedSnapshotStore := SquotSnapshotStore
		project: mixedProject
		artifactSnapshots:
			(mixedProject artifacts
				collect:
					[:each |
					(newArtifacts includes: each)
						ifTrue: [mySnapshot snapshotArtifact: each]
						ifFalse: [newVersionSnapshot snapshotArtifact: each]]).
	self applyMerge: (mixedSnapshotStore snapshot patchRelativeToBase: mySnapshot).
	"Note: the line above may invalidate some snapshots in mySnapshot. That's why we must create a new one further down."
	self loadedVersion: newVersion.
	"...then merge the added packages"
	finalSnapshotStore := mixedSnapshotStore copy.
	newArtifacts do: [:each | finalSnapshotStore putArtifact: (newVersionSnapshot snapshotArtifact: (newVersionSnapshot project artifacts at: each id))].
	mySnapshot := SquotProjectSnapshot fromStore: self.
	merge := finalSnapshotStore snapshot patchRelativeToBase: mySnapshot.
	merge hasChanges ifTrue:
		[| mergeRequest |
		mergeRequest := SquotMergeRequested new
			merge: merge;
			title: 'Merge changes in previously untracked objects';
			signal;
			yourself.
		mergeRequest wasHandled ifFalse:
			[| tool | tool := SquotMergeTool on: merge.
			[tool workingCopy: self;
				controllerForIgnores: self;
				requestSelectedChangesWithTitle: 'Merge changes in previously untracked objects'.
			tool accepted] whileFalse: [self inform: 'Cannot about this merge. But you could choose to exclude all changes to leave your working copy unmodified.']].
		self applyMerge: merge].
	"Merge back saved changes from new historian"
	(repository hasTemporaryVersionsOn: aHistorian) ifTrue:
		[tempHistorian := repository historianForTemporaryVersionsOn: aHistorian.
		merge := SquotProjectMergeFactory new merge: tempHistorian version snapshot into: (SquotProjectSnapshot fromStore: self) basedOn: tempHistorian version parents first snapshot.
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