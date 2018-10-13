applying
applyTo: anObjectContainer
	| order relevant removed |
	order := anObjectContainer loadOrder.
	order := self applyToLoadOrder: order.
	relevant := order select: [:each | diffs includesKey: each].
	removed := diffs keys copyWithoutAll: order.
	relevant, removed do: [:each | anObjectContainer applyDiff: (diffs at: each)].
	anObjectContainer loadOrder: order.