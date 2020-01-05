asserting
assertThirdMethodWillBeAdded: aMerge
	| operation |
	operation := (aMerge mergeAt: packagePath) mergeOfTrackedObject
		modifications
		detect:
			[:each |
			each definition isMethodDefinition
				and: [each toSource asString = thirdMethodSource]]
		ifNone: [testCase fail: 'third method not in the patch'].
	self assert: operation isAddition description: 'third method not added'.