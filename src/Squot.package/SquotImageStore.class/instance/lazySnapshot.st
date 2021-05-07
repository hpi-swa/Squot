snapshotting
lazySnapshot
	| newSnapshot |
	newSnapshot := SquotSnapshot builder.
	self loadOrder do: [:each | newSnapshot add: (self artifactAt: each)].
	^ newSnapshot buildSnapshot