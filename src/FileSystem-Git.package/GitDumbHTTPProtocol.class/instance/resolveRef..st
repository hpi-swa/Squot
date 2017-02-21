command
resolveRef: aRefString
	^  self refs at: (aRefString splitOn: String space) second trimBoth