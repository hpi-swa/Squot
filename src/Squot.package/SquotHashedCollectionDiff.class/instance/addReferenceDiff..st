comparing
addReferenceDiff: aSquotReferenceDiff
	| diff |
	diff := aSquotReferenceDiff asSlotDiff.
	(diff isRemoval or: [diff isAddition])
		ifTrue: [itemChanges add: diff]
		ifFalse: [super addReferenceDiff: aSquotReferenceDiff].