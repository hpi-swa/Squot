changes-operations
materializeCommit: aCommit
	self materializeChangeSets: (self changeSetsFromImageToCommit: aCommit).