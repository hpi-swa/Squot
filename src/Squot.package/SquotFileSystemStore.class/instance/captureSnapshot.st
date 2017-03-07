Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| builder addedPaths unrecordedFiles |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	self artifactsDo: [:each | builder add: each.
		addedPaths add: each path].
	builder add: (unrecordedFiles := SquotUnrecordedFilesArtifact new
		rootDirectory: directory;
		yourself).
	builder buildSnapshot
		in: [:snapshot |
			unrecordedFiles ownerSnapshot: snapshot.
			^ snapshot].