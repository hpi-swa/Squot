comparing
diffWithLeftSnapshot: aMCSnapshot 
	^ SquotPackageDiff forPackageNamed: packageName
		leftSnapshot: aMCSnapshot rightSnapshot: snapshot