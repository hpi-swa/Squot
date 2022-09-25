merging
mergeWithLoad: anArtifactLoad
	"I say the artifact did not exist, but the other side says that it did exist."
	"double dispatch, initiated by #mergeWith:"
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ self shouldNotImplement