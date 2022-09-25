merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| mergeGuide builder |
	mergeGuide := SquotTrackedObjectMetadataMergeGuide working: self base: baseTrackedObjectMetadata incoming:  incomingTrackedObjectMetadata.
	builder := SquotMergeBuilder client: mergeGuide workingRoot: self baseRoot: baseTrackedObjectMetadata incomingRoot: incomingTrackedObjectMetadata.
	builder enqueueInstances: (SquotObjectReflection object: self mirror: self class squotMirror) base: (SquotObjectReflection object: baseTrackedObjectMetadata mirror: baseTrackedObjectMetadata class squotMirror) incoming: (SquotObjectReflection object: incomingTrackedObjectMetadata mirror: incomingTrackedObjectMetadata class squotMirror) reachedVia: nil.
	builder walkUpToEnd.
	^ mergeGuide mergeOfRoot