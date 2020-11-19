accessing objects
lazySnapshot
	"Answer a new snapshot whose artifacts are captured on demand."
	| builder |
	builder := SquotSnapshot builder.
	self loadOrder do: [:each | builder add: (self artifactAt: each) artifact].
	^ builder buildSnapshot