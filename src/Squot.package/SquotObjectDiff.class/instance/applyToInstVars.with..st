patching
applyToInstVars: instVarsDictionary with: aDiffBuilder
	changedInstVars keysAndValuesDo: [:instVarName :diff |
		self apply: diff to: instVarName in: instVarsDictionary with: aDiffBuilder].
	^ instVarsDictionary