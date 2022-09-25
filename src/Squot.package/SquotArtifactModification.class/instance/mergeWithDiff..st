merging
mergeWithDiff: anArtifactDiff
	"double dispatch, initiated by #mergeWith:"
	| merge |
	SquotToggles useNewApi ifTrue: [self deprecated].
	merge := anArtifactDiff right mergeDiffWith: self right basedOn: self left.
	(self willBeLoaded and: [merge willBeLoaded not]) ifTrue: [merge toggleWhetherToLoad].
	^ merge