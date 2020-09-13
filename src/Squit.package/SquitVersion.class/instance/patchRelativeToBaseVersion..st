comparing
patchRelativeToBaseVersion: baseSquitVersion
	"compute tree diff, then deduce object diffs"
	| diff changedPaths mySnapshot baseSnapshot myChangedArtifactPaths baseChangedArtifactPaths deletedPaths patchBuilder max progress |
	self = baseSquitVersion ifTrue: [^ SquotPatch noChangesTo: self].
	SquotGUI displayProgress: 'Diff ', baseSquitVersion shortId, '..', self shortId, ' ... ' during:
		[diff := GitDiffCreator new
			diffTrees: baseSquitVersion commit tree and: self commit tree.
		changedPaths := diff keys collect: [:each | SquotPath fromPath: each].
		mySnapshot := self lazySnapshot.
		baseSnapshot := baseSquitVersion lazySnapshot.
		myChangedArtifactPaths := changedPaths intersection: mySnapshot paths.
		baseChangedArtifactPaths := changedPaths intersection: baseSnapshot paths.
		deletedPaths := baseChangedArtifactPaths copyWithoutAll: myChangedArtifactPaths.
		patchBuilder := baseSquitVersion newPatchBuilder goingTo: self.
		progress := 0. max := myChangedArtifactPaths size + deletedPaths size.
		myChangedArtifactPaths do: [:each |
			SquotGUI updateProgress: progress / max text: each.
			patchBuilder diffPath: each from: baseSnapshot to: mySnapshot.
			progress := progress + 1].
		deletedPaths do:
			[:each | SquotGUI updateProgress: progress / max text: each.
			patchBuilder removeArtifact: (baseSnapshot artifactAt: each).
			progress := progress + 1].
		^ patchBuilder buildPatch]