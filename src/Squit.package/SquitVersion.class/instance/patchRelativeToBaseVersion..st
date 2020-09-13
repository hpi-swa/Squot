comparing
patchRelativeToBaseVersion: baseSquitVersion
	"compute tree diff, then deduce object diffs"
	| diff changedPaths mySnapshot baseSnapshot myChangedArtifactPaths baseChangedArtifactPaths deletedPaths patchBuilder |
	self = baseSquitVersion ifTrue: [^ SquotPatch noChangesTo: self].
	SquotGUI displayProgress: 'Diff ', baseSquitVersion shortId, '..', self shortId, ' ... ' during:
		[:progress |
		diff := GitDiffCreator new
			diffTrees: baseSquitVersion commit tree and: self commit tree.
		changedPaths := diff keys collect: [:each | SquotPath fromPath: each].
		mySnapshot := self lazySnapshot.
		baseSnapshot := baseSquitVersion lazySnapshot.
		myChangedArtifactPaths := changedPaths intersection: mySnapshot paths.
		baseChangedArtifactPaths := changedPaths intersection: baseSnapshot paths.
		deletedPaths := baseChangedArtifactPaths copyWithoutAll: myChangedArtifactPaths.
		patchBuilder := baseSquitVersion newPatchBuilder goingTo: self.
		progress totalSteps: myChangedArtifactPaths size + deletedPaths size.
		myChangedArtifactPaths do: [:each |
			progress stepWithText: each.
			patchBuilder diffPath: each from: baseSnapshot to: mySnapshot].
		deletedPaths do:
			[:each | progress stepWithText: each.
			patchBuilder removeArtifact: (baseSnapshot artifactAt: each)].
		^ patchBuilder buildPatch]