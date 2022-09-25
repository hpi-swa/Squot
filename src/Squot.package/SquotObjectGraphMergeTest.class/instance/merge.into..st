helpers
merge: modifiedObject into: originalObject
	| originalShadow modifiedShadow |
	originalShadow := capturer captureGraph: originalObject.
	objectRegistry assign: (objectRegistry nameOf: originalObject) to: modifiedObject.
	modifiedShadow := capturer captureGraph: modifiedObject.
	^ originalShadow squotMergeWith: modifiedShadow basedOn: originalShadow