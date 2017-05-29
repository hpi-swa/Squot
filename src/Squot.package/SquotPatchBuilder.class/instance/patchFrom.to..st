public
patchFrom: leftObjectContainer to: rightObjectContainer
	self flag: #refactor. "split and extract progress handling"
	self initialize.
	leftArtifacts := leftObjectContainer artifacts.
	rightArtifacts := rightObjectContainer artifacts.
	'Diffing objects' displaySequentialProgress:
	[| progress progressStep | progress := 0.
	progressStep := 1 / (1 max: leftArtifacts size + rightArtifacts size).
	leftArtifacts keysAndValuesDo: [:path :leftArtifact |
		rightArtifacts at: path
			ifPresent: [:myArtifact | | diff |
				diff := leftArtifact diffAgainst: myArtifact.
				diff hasChanges ifTrue: [diffs at: path put: diff]]
			ifAbsent: [ | diff |
				diff := leftArtifact diffAgainst: (SquotAbsentArtifact newFrom: leftArtifact).
				diffs at: path put: diff].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	(rightArtifacts keys reject: [:each | leftArtifacts includesKey: each]) do: [:path | | rightArtifact diff |
		rightArtifact := rightArtifacts at: path.
		diff := rightArtifact absentCopy diffAgainst: rightArtifact.
		diffs at: path put: diff].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	^ SquotPatch with: diffs