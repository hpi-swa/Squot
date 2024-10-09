accessing
setChangeWithConflict: aMergeConflict
	self change: (GSMetadataNameConflictChange
					withChangeSet: self
					conflict: aMergeConflict).