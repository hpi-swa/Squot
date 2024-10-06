accessing
setChangeWithConflict: aMergeConflict
	self change: (SquotPlaintextConflictChange
					withChangeSet: self
					conflict: aMergeConflict).