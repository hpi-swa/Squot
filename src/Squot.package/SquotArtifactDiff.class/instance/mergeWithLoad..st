merging
mergeWithLoad: anArtifactLoad
	"The other side did not change an artifact, but has it unloaded."
	"double dispatch, initiated by #mergeWith:"
	| merge |
	merge := anArtifactLoad right mergeDiffWith: self right basedOn: anArtifactLoad left.
	anArtifactLoad willBeLoaded ~= merge willBeLoaded ifTrue: [merge toggleWhetherToLoad].
	^ merge