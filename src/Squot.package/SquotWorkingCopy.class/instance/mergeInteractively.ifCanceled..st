merging
mergeInteractively: aMerge ifCanceled: aBlock
	| resolvedPatch |
	self selectFromMerge: aMerge
		title: 'Merge'
		ifCancelled: [^ aBlock value].
	resolvedPatch := aMerge resolvedPatch.
	store applyPatch: resolvedPatch.
	^ resolvedPatch