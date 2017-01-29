Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| builder |
	builder := SquotSnapshot builder.
	self artifactsDo: [:each | builder add: each].
	^ builder buildSnapshot