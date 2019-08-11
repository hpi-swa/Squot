merging
privateResolvedPatch
	"Answers the patch that resulted after resolving the conflicts."
	| builder |
	builder := SquotPatch builder.
	builder startingFrom: working.
	containerModifications do: [:each | builder addDiff: each].
	containerConflicts do: [:each | builder addDiff: each resolution].
	elementMerges do: [:each | builder addDiff: each resolvedPatch].
	builder loadOrderDiff: loadOrderMerge resolvedPatch.
	^ builder buildPatch