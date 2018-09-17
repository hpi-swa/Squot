comparing
patchRelativeToBaseVersion: baseSquitVersion
	"compute tree diff, then deduce object diffs"
	| diff changedPaths myArtifacts baseArtifacts myChangedArtifactPaths baseChangedArtifactPaths deletedPaths patchBuilder |
	self = baseSquitVersion ifTrue: [^ SquotPatch empty].
	diff := GitDiffCreator new diffTrees: baseSquitVersion commit tree and: self commit tree.
	changedPaths := diff keys collect: [:each | SquotPath fromPath: each].
	myArtifacts := self lazySnapshot artifacts.
	baseArtifacts := baseSquitVersion lazySnapshot artifacts.
	myChangedArtifactPaths := changedPaths intersection: myArtifacts keys.
	baseChangedArtifactPaths := changedPaths intersection: (baseSquitVersion lazySnapshot artifacts keys).
	deletedPaths := baseChangedArtifactPaths copyWithoutAll: myChangedArtifactPaths.
	patchBuilder := baseSquitVersion newPatchBuilder.
	myChangedArtifactPaths do: [:each |
		patchBuilder diffPath: each from: baseArtifacts to: myArtifacts].
	deletedPaths do: [:each | patchBuilder removeArtifact: (baseArtifacts at: each)].
	^ patchBuilder buildPatch