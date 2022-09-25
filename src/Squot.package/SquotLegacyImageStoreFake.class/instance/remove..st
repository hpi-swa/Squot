adding and removing
remove: anObject
	^ anObject class
		caseOf:
			{[PackageInfo] ->
				[| artifact |
				artifact := workingCopy project artifacts detect:
					[:each | each storeInfo references anySatisfy: [:eachRef | (eachRef at: 'type') = 'package' and: [(eachRef at: 'packageName') = anObject packageName]]].
				self removeAt: artifact path]}
		otherwise:
			[| artifact |
			artifact := workingCopy project artifacts detect:
				[:each | (each storeInfo references anySatisfy: [:eachRef | (eachRef at: 'type') = 'ValueHolder']) and: [(workingCopy storeForArtifact: each) contents == anObject]].
			self removeAt: artifact path].