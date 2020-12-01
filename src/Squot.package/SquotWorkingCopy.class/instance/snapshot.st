creating new versions
snapshot
	"Answer a snapshot where everything is already captured."
	| builder |
	builder := SquotSnapshot builder.
	SquotProgress display: [:path | 'Snapshotting objects... ', path]
		for: self loadOrder
		do: [:each | builder add: (self artifactAt: each) snapshot].
	^ builder buildSnapshot