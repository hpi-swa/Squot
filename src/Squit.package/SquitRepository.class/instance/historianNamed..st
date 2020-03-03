Pur repository
historianNamed: aHistorianName
	| expandedRef |
	^ self withUnitOfWork:
		[expandedRef := self expandShortRefName: aHistorianName.
		SquitHistorian new
			repository: self;
			gitRepository: gitRepository repository;
			name: expandedRef;
			yourself]