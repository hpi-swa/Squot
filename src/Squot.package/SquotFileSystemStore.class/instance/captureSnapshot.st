Pur store
captureSnapshot
	"read files from the filesystem and convert them into SquotArtifacts"
	| snapshot |
	snapshot := self captureLazySnapshot.
	snapshot artifacts
		do: [:each | each capture]
		displayingProgress: 'Reading objects from files'.
	^ snapshot