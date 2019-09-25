Squot-diff-converting
asSquotConflicts
	"Answer a copy of me in which all differences are conflicts in a merge without a base object."
	^ SquotPackageMerge
		into: working
		merge: incoming
		basedOn: (working copyWithSnapshot: MCSnapshot empty)