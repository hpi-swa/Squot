Pur repository
historianNamed: aHistorianName
	^ SquitHistorian new
		repository: self;
		gitRepository: gitRepository repository;
		name: ((aHistorianName beginsWith: 'refs/')
			ifTrue: [aHistorianName]
			ifFalse: [self flag: #hack.
				(gitRepository repository expandRef: aHistorianName)
				ifNotNil: [:expandedRef | expandedRef]
				ifNil: ['refs/heads/', aHistorianName]]);
		yourself