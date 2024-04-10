git-operations
fastForwardTo: aCommit displayName: aString
	self
		updateHeadTo: aCommit
		message: ('merge {1}: Fast-forward' format: {aString}).