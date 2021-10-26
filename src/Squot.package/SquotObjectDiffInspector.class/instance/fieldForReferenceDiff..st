as yet unclassified
fieldForReferenceDiff: aReferenceDiff
	^ (self newFieldForType: #diff key: aReferenceDiff)
		name: aReferenceDiff asString;
		valueGetter: [:diff | aReferenceDiff];
		yourself