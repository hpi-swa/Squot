results
selectedPatch
	| adjustedDiffs rootNodesByArtifact patchBuilder |
	self accepted ifFalse: [^ SquotPatch empty].
	"Answer a patch that describes all selected DiffNodes."
	rootNodesByArtifact := Dictionary withAll:
		(diffRootNodes collect: [:each | (diffs at: each title) -> each]).
	adjustedDiffs := diffs
		collect: [:each |
			rootNodesByArtifact at: each
				ifPresent: [:node | each adjustedBy: node]
				ifAbsent: [each]]
		thenSelect: [:each | each hasChanges].
	patchBuilder := SquotPatch builder.
	adjustedDiffs do: [:each | patchBuilder addDiff: each].
	^ patchBuilder buildPatch