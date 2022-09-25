merging
mergeWithLoad: anArtifactLoad
	"The other side simply says that the artifact was not loaded, not that there were changes. Therefore, the removal takes precedence."
	"double dispatch, initiated by #mergeWith:"
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ self