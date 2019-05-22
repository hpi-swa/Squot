copying
createNewBuilder
	| builder |
	builder := self species builder.
	builder startingFrom: base; goingTo: patched.
	self diffsDo: [:each | builder addDiff: each copy].
	builder loadOrderDiff: loadOrderDiff.
	^ builder