merging
mergeWithDiff: anArtifactDiff
	"double dispatch, initiated by #mergeWith:"
	| merge |
	merge := anArtifactDiff right mergeDiffWith: self right basedOn: self left.
	willBeLoaded ~= merge willBeLoaded ifTrue: [merge toggleWhetherToLoad].
	^ merge