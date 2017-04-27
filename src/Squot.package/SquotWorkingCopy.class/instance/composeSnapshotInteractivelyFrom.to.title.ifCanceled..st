private
composeSnapshotInteractivelyFrom: baseSnapshot
to: proposedSnapshot
title: titleString
ifCanceled: cancelBlock
	| snapshotBuilder selectedChanges |
	self flag: #optimize. "work with diffs, not whole snapshots"
	selectedChanges := self
		selectChangedArtifactsFrom: baseSnapshot
		to: proposedSnapshot
		title: titleString
		ifCanceled: [^ cancelBlock value].
	snapshotBuilder := baseSnapshot createNewBuilder.
	selectedChanges do: [:each | snapshotBuilder add: each].
	^ snapshotBuilder buildSnapshot