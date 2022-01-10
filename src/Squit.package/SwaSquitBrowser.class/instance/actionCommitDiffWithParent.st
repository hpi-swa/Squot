actions
actionCommitDiffWithParent

	self withUnitOfWork:
		[(SquotDiffExplorer
			from: (self selectedCommit parents at: 1 ifAbsent: [SquotSnapshot empty])
			to: self selectedCommit)
		workingCopy: self selectedRepository;
		openLabel: 'Comparing versions'].