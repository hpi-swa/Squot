patching
squotApplyToLoaded: anObject with: aMetaobjectPatcher
	changedInstVars keysAndValuesDo: [:instVarName :diff |
		anObject
			instVarNamed: instVarName
			put: (aMetaobjectPatcher apply: diff toLoaded: (anObject instVarNamed: instVarName))].
	changedVariablePart ifNotNil:
		[changedVariablePart keysAndValuesDo: [:index :diff |
			anObject
				at: index
				put: (aMetaobjectPatcher apply: diff toLoaded: (anObject at: index))]].
	^ anObject