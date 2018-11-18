copying
copy
	"Create a copy of me with copies of the diffs, using the patch builder."
	"Similar to createNewBuilder, but with copies of the diffs and answers the built patch."
	| builder |
	builder := self species builder.
	self diffsDo: [:each | builder addDiff: each copy].
	builder loadOrderDiff: loadOrderDiff.
	^ builder buildPatch