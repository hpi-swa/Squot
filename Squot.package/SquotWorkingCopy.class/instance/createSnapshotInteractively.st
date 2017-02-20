creating new versions
createSnapshotInteractively
	| snapshotBuilder loadedSnapshot baseSnapshot selectedChanges |
	self flag: #optimize.
	loadedSnapshot := store captureSnapshot.
	selectedChanges := self selectChangedArtifactsFrom: (baseSnapshot := self baseSnapshot) to: loadedSnapshot.
	selectedChanges ifNil: [^ nil].
	snapshotBuilder := baseSnapshot createNewBuilder.
	selectedChanges do: [:each | snapshotBuilder add: each].
	^ snapshotBuilder buildSnapshot