converting
snapshot
	"Make sure all my artifacts are snapshots."
	| builder |
	self flag: #todo. "It smells that snapshots are sometimes lazy, capturing only on demand. Maybe there should be another kind of object for artifact listings and on-demand cache behavior."
	builder := SquotSnapshot builder.
	self artifactsInLoadOrderDo: [:each | builder add: each snapshot].
	^ builder buildSnapshot