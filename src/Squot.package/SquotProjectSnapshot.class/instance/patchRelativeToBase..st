comparing
patchRelativeToBase: aProjectSnapshot
	| merge |
	merge := aProjectSnapshot squotMergeWith: self basedOn: aProjectSnapshot.
	^ merge