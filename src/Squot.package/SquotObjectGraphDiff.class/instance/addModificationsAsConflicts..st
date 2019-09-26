merging
addModificationsAsConflicts: anObjectGraphMerge 
	self modifications do:
		[:each | | merge |
		merge := each asSquotConflicts.
		merge isConflict
			ifTrue: [anObjectGraphMerge addConflict: merge]
			ifFalse: [anObjectGraphMerge addMerge: merge]].