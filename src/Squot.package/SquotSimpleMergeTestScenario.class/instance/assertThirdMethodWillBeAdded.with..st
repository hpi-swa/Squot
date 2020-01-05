asserting
assertThirdMethodWillBeAdded: aMerge with: aTestCase
	| operation |
	operation := (aMerge mergeAt: packagePath) mergeOfTrackedObject resolvedPatch
		operations
		detect:
			[:each |
			each definition isMethodDefinition
				and: [each toSource asString = thirdMethod source]]
		ifNone: [aTestCase fail: 'third method not in the patch'].
	aTestCase assert: operation isAddition description: 'third method not added'.