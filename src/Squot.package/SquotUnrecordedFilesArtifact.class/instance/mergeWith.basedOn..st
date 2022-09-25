merging
mergeWith: anArtifact basedOn: baseArtifact
	"Unsupported for now, do not return any differences."
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ SquotArtifactMerge into: self merge: anArtifact basedOn: baseArtifact
		willBeLoaded: false
		graphMerge: SquotObjectGraphMerge new
		metadataMerge: SquotTrackedObjectMetadataMerge new