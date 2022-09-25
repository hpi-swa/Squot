comparing
patchRelativeToBase: aProjectSnapshot
	| merge |
	merge := SquotProjectMergeFactory new
		merge: self into: aProjectSnapshot basedOn: aProjectSnapshot.
	^ merge