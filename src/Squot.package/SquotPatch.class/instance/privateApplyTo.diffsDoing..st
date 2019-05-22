applying
privateApplyTo: anObjectContainer diffsDoing: aBlock
	| order relevant removed |
	order := anObjectContainer loadOrder.
	order := self applyToLoadOrder: order.
	relevant := order select: [:each | diffs includesKey: each].
	removed := diffs keys copyWithoutAll: order.
	aBlock value: removed, relevant value: [:each | anObjectContainer applyDiff: (diffs at: each)].
	anObjectContainer loadOrder: order.