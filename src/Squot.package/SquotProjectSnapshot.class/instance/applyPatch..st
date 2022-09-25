patching
applyPatch: aProjectMerge
	^ (SquotSnapshotStore
		project: (SquotProject id: id metadata: metadata artifacts: artifacts)
		artifactSnapshots: (artifacts collect: [:each | self snapshotArtifact: each]))
		applyPatch: aProjectMerge;
		yourself