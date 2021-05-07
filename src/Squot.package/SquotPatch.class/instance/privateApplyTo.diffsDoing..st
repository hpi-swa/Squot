applying
privateApplyTo: anObjectContainer diffsDoing: aBlock
	"Patch anObjectContainer and answer a lazy snapshot of its new state."
	| order relevant removed patchedArtifacts newSnapshot |
	order := anObjectContainer loadOrder.
	order := self applyToLoadOrder: order.
	relevant := order select: [:each | diffs includesKey: each].
	removed := diffs keys copyWithoutAll: order.
	patchedArtifacts := Dictionary new.
	aBlock
		value: removed, relevant
		value: [:each | patchedArtifacts at: each
							put: (anObjectContainer applyDiff: (diffs at: each))].
	anObjectContainer loadOrder: order.
	
	"Prepare new snapshot with artifacts already captured in the process of patching."
	newSnapshot := SquotSnapshot builder startingFrom: anObjectContainer.
	"Most containers implement a lazy snapshot in their #artifacts implementation. See SquotSnapshotBuilder>>#startingFrom:."
	"Stored artifacts could be slightly different than each `diff right`, so cannot simply apply the diffs to the newSnapshot."
	removed, relevant do:
		[:each |
		(diffs at: each) isRemoval
			ifTrue: [newSnapshot removeAt: each]
			ifFalse: [newSnapshot add: (patchedArtifacts at: each)]].
	newSnapshot loadOrder: order.
	^ newSnapshot buildSnapshot