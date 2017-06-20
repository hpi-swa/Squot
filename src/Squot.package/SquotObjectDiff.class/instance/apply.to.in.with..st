patching
apply: diff to: instVarName in: instVarsDictionary with: aDiffBuilder
	instVarsDictionary
		at: instVarName
		put: (aDiffBuilder apply: diff
			to:  (instVarsDictionary at: instVarName ifAbsent: [^ self]))