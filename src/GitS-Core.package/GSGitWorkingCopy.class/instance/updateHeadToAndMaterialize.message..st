git-operations
updateHeadToAndMaterialize: aCommit message: aString
	self
		updateHeadTo: aCommit message: aString;
		materializeCommit: aCommit.