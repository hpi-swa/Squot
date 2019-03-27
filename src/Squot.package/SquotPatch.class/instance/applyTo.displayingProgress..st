applying
applyTo: anObjectContainer displayingProgress: progressText
	| order relevant removed |
	order := anObjectContainer loadOrder.
	order := self applyToLoadOrder: order.
	relevant := order select: [:each | diffs includesKey: each].
	removed := diffs keys copyWithoutAll: order.
	(relevant, removed) asSet do: [:each | anObjectContainer applyDiff: (diffs at: each)] displayingProgress: progressText.
	anObjectContainer loadOrder: order.