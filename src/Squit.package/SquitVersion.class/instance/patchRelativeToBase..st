comparing
patchRelativeToBase: objectContainer
	"Answer a patch that when applied to objectContainer will make our objects equal."
	| diffs base mine |
	objectContainer species = self species
		ifTrue: [^ self patchRelativeToBaseVersion: objectContainer].
	diffs := Dictionary new.
	base := objectContainer artifacts.
	mine := self artifacts.
	'Diffing objects' displaySequentialProgress:
	[| progress progressStep | progress := 0.
	progressStep := 1 / (base size + mine size).
	base keysAndValuesDo: [:path :baseArtifact |
		mine at: path
			ifPresent: [:myArtifact | | diff |
				diff := baseArtifact diffAgainst: myArtifact.
				diff hasChanges ifTrue: [diffs at: path put: diff]]
			ifAbsent: [ | diff |
				diff := baseArtifact diffAgainst: (SquotAbsentArtifact newFrom: baseArtifact).
				diffs at: path put: diff].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	(mine keys reject: [:each | base includesKey: each]) do: [:path | | myArtifact diff |
		myArtifact := mine at: path.
		diff := myArtifact absentCopy diffAgainst: myArtifact.
		diffs at: path put: diff].
		ProgressNotification signal: (progress := progress + progressStep) extra: nil].
	^ SquotPatch with: diffs