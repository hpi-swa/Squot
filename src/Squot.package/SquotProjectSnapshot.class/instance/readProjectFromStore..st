initialize-release
readProjectFromStore: aProjectStore
	| project |
	project := aProjectStore readProject.
	id := project id.
	metadata := project metadata.
	store := aProjectStore.
	artifacts := project artifacts.
	snapshots := SquotSnapshotStore project: project artifactSnapshots: #() "for now".