results
selectedPatch
	| adjustedDiffs rootNodesByArtifact patchBuilder |
	self accepted ifFalse: [^ SquotPatch empty].
	"Answer a patch that describes all selected DiffNodes."
	rootNodesByArtifact := Dictionary withAll:
		(rootNodes collect: [:each | each content -> each]).
	adjustedDiffs := editedPatch diffs collect: [:each |
		rootNodesByArtifact at: each
			ifPresent: [:node | self adjustedDiff: each byExclusionsBelow: node]
			ifAbsent: [each]].
	patchBuilder := SquotPatch builder.
	adjustedDiffs
		select: [:each | each hasChanges]
		thenDo: [:each | patchBuilder addDiff: each].
	self adjustLoadOrder: patchBuilder.
	^ patchBuilder buildPatch