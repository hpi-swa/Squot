*Squot-diff-applying
squotApplyToLoaded: anObject
	"Modify anObject such that it matches what I model"
	changedInstVars keysAndValuesDo: [:instVarName :diff |
		anObject
			instVarNamed: instVarName
			put: (diff squotApplyToLoaded: (anObject instVarNamed: instVarName))].
	^ anObject