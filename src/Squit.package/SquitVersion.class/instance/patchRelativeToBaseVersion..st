comparing
patchRelativeToBaseVersion: baseSquitVersion
	"compute tree diff, then deduce object diffs"
	| diff paths mine theirs myChangedArtifactPaths baseChangedArtifactPaths deletedPaths diffs |
	diff := GitDiffCreator new diffTrees: baseSquitVersion commit tree and: self commit tree.
	paths := diff keys collect: [:each | SquotPath fromPath: each].
	mine := self lazySnapshot artifacts.
	theirs := baseSquitVersion lazySnapshot artifacts.
	myChangedArtifactPaths := paths intersection: (self lazySnapshot artifacts keys).
	baseChangedArtifactPaths := paths intersection: (baseSquitVersion lazySnapshot artifacts keys).
	deletedPaths := baseChangedArtifactPaths difference: myChangedArtifactPaths.
	diffs := Dictionary new.
	myChangedArtifactPaths do: [:each |
		diffs at: each put: ((theirs at: each) diffAgainst: (mine at: each))].
	deletedPaths do: [:each |
		diffs at: each put: ((theirs at: each) diffAgainst: (theirs at: each) absentCopy)].
	^ SquotPatch with: diffs