comparing
patchRelativeToBaseVersion: baseSquitVersion
	"compute tree diff, then deduce object diffs"
	| diff paths mine bases myChangedArtifactPaths baseChangedArtifactPaths deletedPaths diffs |
	self = baseSquitVersion ifTrue: [^ SquotPatch empty].
	diff := GitDiffCreator new diffTrees: baseSquitVersion commit tree and: self commit tree.
	paths := diff keys collect: [:each | SquotPath fromPath: each].
	mine := self lazySnapshot artifacts.
	bases := baseSquitVersion lazySnapshot artifacts.
	myChangedArtifactPaths := paths intersection: mine keys.
	baseChangedArtifactPaths := paths intersection: (baseSquitVersion lazySnapshot artifacts keys).
	deletedPaths := baseChangedArtifactPaths difference: myChangedArtifactPaths.
	diffs := Dictionary new.
	myChangedArtifactPaths do: [:each |
		diffs at: each put:
			(bases at: each
				ifPresent: [:base | base diffAgainst: (mine at: each)]
				ifAbsent: [SquotArtifactAddition of: (mine at: each)])].
	deletedPaths do: [:each |
		diffs at: each put: (SquotArtifactRemoval of: (bases at: each))].
	diffs keysAndValuesRemove: [:path :eachDiff |
		eachDiff hasChanges not "tree changed, but serialized objects did not..."].
	^ SquotPatch with: diffs