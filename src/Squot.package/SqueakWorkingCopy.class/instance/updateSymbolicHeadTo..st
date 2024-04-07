git-operations
updateSymbolicHeadTo: aStringOrCommit
	(aStringOrCommit isKindOf: GitCommit) ifTrue: [
		^ self updateSymbolicHeadToCommit: aStringOrCommit hexHash].
	(self isSqueakBranchRef: aStringOrCommit)
		ifTrue: [self updateSymbolicHeadToRef: aStringOrCommit]
		ifFalse: [self updateSymbolicHeadToCommit: aStringOrCommit].