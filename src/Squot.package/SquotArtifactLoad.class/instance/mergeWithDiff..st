merging
mergeWithDiff: anArtifactDiff
	"double dispatch, initiated by #mergeWith:"
	| merge |
	SquotToggles useNewApi ifTrue: [self deprecated].
	merge := anArtifactDiff right mergeDiffWith: self right basedOn: self left.
	willBeLoaded ~= merge willBeLoaded ifTrue: [merge toggleWhetherToLoad].
	^ merge