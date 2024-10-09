accessing
setChangeWithConflict: aMergeConflict
	self change: (GSPlaintextConflictChange
					withChangeSet: self
					conflict: aMergeConflict).