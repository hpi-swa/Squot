Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| snapshot |
	snapshot := self captureLazySnapshot.
	SquotProgress display: 'Reading objects from files'
		for: snapshot artifacts
		do: [:each | each capture].
	^ snapshot