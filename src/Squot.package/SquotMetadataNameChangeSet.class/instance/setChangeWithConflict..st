accessing
setChangeWithConflict: aMergeConflict
	self change: (SquotMetadataNameConflictChange
					withChangeSet: self
					conflict: aMergeConflict).