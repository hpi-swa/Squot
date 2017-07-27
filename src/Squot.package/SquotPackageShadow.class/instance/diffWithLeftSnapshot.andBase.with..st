comparing
diffWithLeftSnapshot: leftMCSnapshot andBase: baseMCSnapshot with: aDiffBuilder
	^ SquotPackageDiff forPackageNamed: packageName
		leftSnapshot: leftMCSnapshot rightSnapshot: snapshot baseSnapshot: baseMCSnapshot