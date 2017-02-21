Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| builder addedPaths nonSquotVisitor |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	self artifactsDo: [:each | builder add: each.
		addedPaths add: each path].
	nonSquotVisitor := SquotUnacquaintedFileVisitor
		on: self
		ignoring: addedPaths
		addingTo: builder.
	nonSquotVisitor visit: directory.
	^ builder buildSnapshot