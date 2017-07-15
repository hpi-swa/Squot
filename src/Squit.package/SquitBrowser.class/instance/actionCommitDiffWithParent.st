actions on versions
actionCommitDiffWithParent
	(SquotDiffExplorer
		from: (self commitSelection parents at: 1
			ifPresent: [:parent | parent snapshot]
			ifAbsent: [SquotSnapshot empty])
		to: self commitSelection snapshot)
	openLabel: 'Comparing versions'.