Pur store
captureLazySnapshot
	"read the table of contents and create lazy loading artifacts from the entries"
	| builder addedPaths unrecordedFiles snapshot |
	builder := SquotSnapshot builder.
	addedPaths := Set new.
	self lazyArtifactsDo:
		[:each |	builder add: each.
				addedPaths add: each path].
	builder add: (unrecordedFiles := SquotUnrecordedFilesArtifact new
		rootDirectory: directory;
		yourself).
	snapshot := builder buildSnapshot.
	unrecordedFiles ownerSnapshot: snapshot.
	^ snapshot