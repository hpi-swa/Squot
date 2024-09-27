serializing
stonAllInstVarNames
	^ super stonAllInstVarNames sorted:
		[:each | each = 'version' ifTrue: [1] ifFalse: [2]] ascending, "version first to check it before others"
		SortFunction default "sort rest alphabetically, for consistency"