patching
privateApplyDiff: aSquotMetaobjectDiff
	instVars := aSquotMetaobjectDiff applyToInstVars: instVars.
	variableSizePart := aSquotMetaobjectDiff applyToVariablePart: variableSizePart.