ui
branchButtonHelpText
	| extra |
	self hasBranchSelection ifTrue:
		[self withUnitOfWork: [extra := ' at the head of the branch ''', selectedHistorian shortName, '''']].
	^ 'Create a new branch', (extra ifNil: [''])