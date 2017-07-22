switching historians
restoreUnsavedChangesFrom: stashHistorian
	| patch |
	patch := (stashHistorian version ifNil: [^ self]) patchRelativeToBase: self baseVersion.
	store applyPatch: patch.