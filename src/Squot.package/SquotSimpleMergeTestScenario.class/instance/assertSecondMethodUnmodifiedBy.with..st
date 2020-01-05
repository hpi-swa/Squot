asserting
assertSecondMethodUnmodifiedBy: aMerge with: aTestCase
	aTestCase deny:
		((aMerge mergeAt: packagePath) mergeOfTrackedObject resolvedPatch operations 
			anySatisfy:
				[:each |
				each definition isMethodDefinition
				and: [each definition selector = secondMethod selector]]).