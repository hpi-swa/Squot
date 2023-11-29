actions
actionSwitchToBranch: aString
	self
		actionSwitchToCommit: (self unitOfWork objectReferenced: aString)
		displayName: (GitReference shortName: aString)
		updateHeadTo: aString.