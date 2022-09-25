snapshot
buildSnapshot
	artifactSnapshots writeProject: project.
	^ SquotProjectSnapshot fromStore: artifactSnapshots