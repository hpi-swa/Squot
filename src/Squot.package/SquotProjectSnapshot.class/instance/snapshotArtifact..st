accessing
snapshotArtifact: anArtifact
	"Read the artifact from the underlying store, and answer the resulting snapshot of the artifact. If another snapshot of the same artifact is requested, answer the same (cached) snapshot again."
	| snapshot |
	(snapshots includesArtifact: anArtifact) ifTrue: [^ snapshots readArtifact: anArtifact].
	snapshot := (store storeForArtifact: anArtifact) readArtifact: anArtifact.
	snapshots putArtifact: snapshot.
	^ snapshot