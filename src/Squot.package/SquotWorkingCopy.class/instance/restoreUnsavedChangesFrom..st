switching historians
restoreUnsavedChangesFrom: stashHistorian
	| stashDiffs stashedArtifacts |
	stashDiffs := self diffsFromUnsavedChangesVersion: stashHistorian version.
	stashDiffs ifEmpty: [^ self].
	stashedArtifacts := stashHistorian version snapshot artifacts.
	self restoreUnsavedChangesFromDiffs: stashDiffs andArtifacts: stashedArtifacts