comparing
asBaseDiffLeft: leftMCSnapshot withRight: packageShadow with: aDiffBuilder
	^ (packageShadow
		diffWithLeftSnapshot: leftMCSnapshot
		andBase: snapshot
		with: aDiffBuilder)
		base: self;
		yourself