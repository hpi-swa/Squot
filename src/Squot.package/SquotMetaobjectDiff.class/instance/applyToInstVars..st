patching
applyToInstVars: instVarsDictionary
	changedInstVars keysAndValuesDo: [:instVarName :diff |
		instVarsDictionary
			at: instVarName
			put: (diff squotApplyTo:
				(instVarsDictionary at: instVarName ifAbsent: [nil asSquotContent]))].
	^ instVarsDictionary