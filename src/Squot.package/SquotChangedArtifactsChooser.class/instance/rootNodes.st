ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	artifactDiffs := Dictionary new.
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
						(SquotDiffNode title: path content: nil children: nodes)]]].
	(proposed keys reject: [:each | original includesKey: each]) do: [:path | | proposedArtifact diff |
		proposedArtifact := proposed at: path.
		diff := proposedArtifact absentCopy diffAgainst: proposedArtifact.
		artifactDiffs at: path put: diff.
		diff topNodes ifNotEmpty: [:nodes |
			rootNodes add:
				(SquotDiffNode title: path content: nil children: nodes)]].
	^ rootNodes