mutating
createNewBuilder
	| builder |
	builder := self species builder.
	diffs do: [:each | builder addDiff: each].
	builder loadOrderDiff: loadOrderDiff.
	^ builder