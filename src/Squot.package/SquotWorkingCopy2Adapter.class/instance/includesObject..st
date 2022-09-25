testing
includesObject: anObject
	^ anObject class caseOf:
		{[PackageInfo] ->
			[workingCopy project artifacts anySatisfy:
				[:each | (each storeInfo references anySatisfy: [:eachReference | ((eachReference at: 'type') = 'package') and: [(eachReference at: 'packageName') = anObject packageName]]) "and: [(workingCopy storeForArtifact: each) includesArtifact: each] <-- SquotImageStore also did not register the package in the environment when added."]]}
		otherwise:
			[workingCopy project artifacts anySatisfy:
				[:each | (workingCopy storeForArtifact: each) contents = anObject]]