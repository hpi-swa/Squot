Squot-diff-converting
asSquotConflicts
	"Answer a copy of me in which all differences are conflicts in a merge without a base object."
	^ SquotMonticelloMergeDiff
		operations: #()
		conflicts: (patch operations collect: [:each | MCConflict operation: each])