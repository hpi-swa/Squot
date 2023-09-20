diffing
diffFromLines: fromCollection toLines: toCollection
	^ self joinTexts: ((self diffChunksFrom: fromCollection to: toCollection) collect: [:each |
		"each is either (#common -> {...}) or (#different -> ({...} -> {...}))"
		each key caseOf: {
			[#common] -> [self asCommonText: (self joinStrings: each value)].
			[#different] -> [self joinTexts: (
				(each value key collect: [:line | self asRemovalText: line]),
				(each value value collect: [:line | self asAdditionText: line]))]}])