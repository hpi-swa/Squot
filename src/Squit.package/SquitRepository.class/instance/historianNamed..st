Pur repository
historianNamed: aHistorianName
	| expandedRef |
	^ self withUnitOfWork:
		[expandedRef := self expandShortRefName: aHistorianName.
		SquitHistorian
			newNamed: expandedRef 
			repository: self
			git: gitRepository repository]