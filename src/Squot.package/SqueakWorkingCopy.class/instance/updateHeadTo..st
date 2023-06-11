git-operations
updateHeadTo: aString
	(self isSqueakBranchRef: aString)
		ifTrue: [self updateHeadToRef: aString]
		ifFalse: [self updateHeadToCommit: aString].