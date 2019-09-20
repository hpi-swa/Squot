comparing
diffWithLeftSnapshot: leftMCSnapshot andBase: baseMCSnapshot with: aDiffBuilder
	self flag: #todo. "Introduce a separate class for package merges (instead of diffs)"
	^ (SquotPackageDiff forPackageNamed: packageName
		leftSnapshot: leftMCSnapshot rightSnapshot: snapshot baseSnapshot: baseMCSnapshot)
		incoming: self;
		yourself