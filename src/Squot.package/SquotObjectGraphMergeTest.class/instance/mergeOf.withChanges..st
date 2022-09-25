helpers
mergeOf: anObject withChanges: aBlock
	| originalShadow modifiedShadow holder |
	holder := SquotValueHolderStore new.
	holder contents: anObject.
	originalShadow := capturer captureFrom: holder objectReference.
	aBlock value.
	modifiedShadow := capturer captureFrom: holder objectReference.
	^ originalShadow squotMergeWith: modifiedShadow basedOn: originalShadow