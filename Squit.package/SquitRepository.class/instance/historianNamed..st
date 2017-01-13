Pur repository
historianNamed: aHistorianName
	^ SquitHistorian new
		repository: self;
		gitRepository: gitRepository repository;
		name: aHistorianName;
		yourself