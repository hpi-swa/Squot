dialog
onConflictOpenDialogToMaterializeChangeSets: aCollection windowTitle: aString
	(GSChangeSet anyIncludesConflicts: aCollection) ifTrue: [
		^ self
			openDialogToMaterializeChangeSets: aCollection
			windowTitle: aString].
	self activeWorkingCopy materializeChangeSets: aCollection.
	^ Promise unit: nil