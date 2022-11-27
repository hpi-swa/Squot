switching historians
switchTo: aHistorian
	| fromHistorian originVersion targetVersion temporarySnapshot addedObjects mergeReaddedObjects |
	fromHistorian := self loadedHistorian.
	originVersion := fromHistorian version.
	originVersion ifNil: [originVersion := SquotSnapshot empty].
	targetVersion := aHistorian version.
	self withCurrentSnapshot: [self temporarilySaveChangesOn: fromHistorian].
	SquotProgress displayStatus: 'Loading ', (targetVersion printStringLimitedTo: 100) during:
	[self withCurrentSnapshot:
		[| patch |
		"The other branch may have packages that are already loaded (and changed)."
		self addGlobalObjectsToStore: targetVersion;
			updateLoadOrderFromVersion: targetVersion.
		temporarySnapshot := targetVersion snapshot createNewBuilder.
		addedObjects := self artifacts reject: [:each | originVersion includesObjectAt: each path].
		addedObjects do: [:each | temporarySnapshot add: each snapshot "overwrite"].
		temporarySnapshot := temporarySnapshot buildSnapshot.
		"Load other branch. First without the added packages..."
		self loadedHistorian: aHistorian.
		patch := temporarySnapshot patchRelativeToBase: self lazySnapshot.
		self assert: (patch diffs allSatisfy: [:each | addedObjects noneSatisfy: [:eachAdded | eachAdded path = each path]]).
		self applyPatch: patch.
		self loadedVersion: targetVersion]].
	addedObjects ifNotEmpty:
		[SquotProgress displayStatus: 'Merging previously untracked objects' during:
		[| workingCopyWithoutAddedObjects |
		self withCurrentSnapshot:
			[workingCopyWithoutAddedObjects := self newSnapshotBuilder.
			addedObjects do: [:each | workingCopyWithoutAddedObjects removeAt: each path].
			mergeReaddedObjects := SquotMerge into: self merge: targetVersion basedOn: self.
			mergeReaddedObjects hasChanges ifTrue:
				[ | accepted |
				[accepted := true.
				self selectFromMerge: mergeReaddedObjects
					title: 'Merge changes in previously untracked objects'
					ifCancelled:
						[self inform: 'Cannot abort this merge. But you could choose to exclude all changes to discard them.'.
						accepted := false].
				accepted] whileFalse.
				self applyPatch: mergeReaddedObjects resolvedPatch]]]].
	"Finally, also merge any changes stashed on the branch to which we switch."
	self withCurrentSnapshot: [self mergeTemporaryVersionsOn: aHistorian].