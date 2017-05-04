ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	artifactDiffs := Dictionary new.
	'Diffing snapshots' displaySequentialProgress:
	[| progress progressStep | progress := 0.
	progressStep := 1 / (original size + proposed size).
	original keysAndValuesDo: [:path :originalArtifact |
		proposed at: path
			ifPresent: [:proposedArtifact | | diff |
				diff := originalArtifact diffAgainst: proposedArtifact.
				artifactDiffs at: path put: diff.
				diff topNodes ifNotEmpty: [:nodes |
					rootNodes add:
						(SquotDiffNode title: path content: nil children: nodes)]]
			ifAbsent: [ | diff |
				diff := originalArtifact diffAgainst: (SquotAbsentArtifact newFrom: originalArtifact).
				artifactDiffs at: path put: diff.
				diff topNodes ifNotEmpty: [:nodes |
					rootNodes add:
						(SquotDiffNode title: path content: nil children: nodes)]].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	(proposed keys reject: [:each | original includesKey: each]) do: [:path | | proposedArtifact diff |
		proposedArtifact := proposed at: path.
		diff := proposedArtifact absentCopy diffAgainst: proposedArtifact.
		artifactDiffs at: path put: diff.
		diff topNodes ifNotEmpty: [:nodes |
			rootNodes add:
				(SquotDiffNode title: path content: nil children: nodes)]].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	^ rootNodes