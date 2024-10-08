testing
shouldOpenDialog
	self shouldAlwaysOpenDialog ifTrue: [^ true].
	^ SquotChangeSet anyIncludesConflicts: self changeSets