common-prefix
commonPrefixOf: aCollection ifNone: aBlock
	^ aCollection size caseOf: {
		[0] -> [aBlock value].
		[1] -> [aCollection first].
	} otherwise: [aCollection reduce: [:a :b | self commonPrefixOf: a and: b]]