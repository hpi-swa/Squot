switching historians
switchTo: aHistorian
	| fromHistorian originVersion targetVersion temporarySnapshot mergeReaddedObjects |
	fromHistorian := self loadedHistorian.
	originVersion := fromHistorian version.
	targetVersion := aHistorian version.
	self withCurrentSnapshot:
		[self temporarilySaveChangesOn: fromHistorian].
	self withCurrentSnapshot:
		["The other branch may have packages that are already loaded (and changed)."
		self addGlobalObjectsToStore: targetVersion;
			updateLoadOrderFromVersion: targetVersion.
		temporarySnapshot := targetVersion snapshot createNewBuilder.
		(self artifacts reject: [:each | originVersion includesObjectAt: each path])
			do: [:each | temporarySnapshot add: each snapshot "may overwrite"].
		temporarySnapshot loadOrder:
			((SquotLoadOrderMerge
				into: temporarySnapshot loadOrder
				merge: (self loadOrder intersection: temporarySnapshot loadOrder)
				basedOn: (self loadOrder intersection: targetVersion loadOrder))
				resolvedPatch applyTo: temporarySnapshot loadOrder).
		temporarySnapshot := temporarySnapshot buildSnapshot.
		"Load other branch"
		self loadedHistorian: aHistorian.
		self privateLoadVersion: targetVersion].
	self withCurrentSnapshot: [self mergeTemporaryVersionsOn: aHistorian].
	"Restore unsaved changes to packages that were loaded but untracked"
	self withCurrentSnapshot:
		[mergeReaddedObjects := SquotMerge into: self merge: temporarySnapshot basedOn: targetVersion.
		mergeReaddedObjects hasChanges	
			ifTrue:
				[ | accepted |
				[accepted := true.
				self selectFromMerge: mergeReaddedObjects
					title: 'Restore changes in previously untracked objects'
					ifCancelled:
						[self inform: 'Cannot abort this merge. But you could choose to exclude all changes to discard them.'.
						accepted := false].
				accepted] whileFalse.
				self applyPatch: mergeReaddedObjects resolvedPatch]].