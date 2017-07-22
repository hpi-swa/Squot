switching historians
restoreUnsavedChangesFromDiffs: unsavedDiffs andArtifacts: unsavedArtifacts
	| currentArtifacts patchedArtifacts patchedSnapshot |
	currentArtifacts := self currentSnapshot artifacts.
	patchedArtifacts := unsavedDiffs collect: [:each |
		(currentArtifacts at: each path
			ifAbsent: [(unsavedArtifacts at: each path) absentCopy])
		copyWithDiffApplied: each].
	patchedSnapshot := SquotSnapshot builder in: [:snapshot |
		patchedArtifacts do: [:each | each ifPresent: [snapshot add: each]]]; buildSnapshot.
	self loadSnapshot: patchedSnapshot.