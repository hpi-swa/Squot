switching historians
mergeSilently: incomingObjectContainer basedOn: baseObjectContainer onConflictsDo: aBlock
	| merge |
	self withCurrentSnapshot:
		[merge := SquotMerge into: self
			merge: incomingObjectContainer
			basedOn: baseObjectContainer.
		merge hasConflicts 	ifTrue: [aBlock cull: merge].
		store applyPatch: merge resolvedPatch].