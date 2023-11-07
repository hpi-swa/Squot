accessing
setChangeWith: aMergeConflict
	self change: (SquotPlaintextConflictChange
					withChangeSet: self
					conflict: aMergeConflict).