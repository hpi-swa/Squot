results
selectedPatch
	| adjustedDiffs rootNodesByArtifact |
	self accepted ifFalse: [^ SquotPatch empty].
	"Answer a patch that describes all selected DiffNodes."
	rootNodesByArtifact := Dictionary withAll:
		(diffRootNodes collect: [:each | (diffs at: each title) -> each]).
	adjustedDiffs := diffs collect: [:each |
		rootNodesByArtifact at: each
			ifPresent: [:node | each adjustedBy: node]
			ifAbsent: [each]].
	^ SquotPatch with: adjustedDiffs