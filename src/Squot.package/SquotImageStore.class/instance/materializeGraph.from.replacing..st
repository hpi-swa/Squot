private materializing
materializeGraph: anObjectGraph from: anArtifact replacing: anObject
	| metadata materializedObject |
	metadata := additionalInfo at: anArtifact path
		ifPresent: [:existing | existing mergeWith: anArtifact storeInfo]
		ifAbsent: [anArtifact storeInfo].
	SquotCurrentMetadata value: metadata during:
		[materializedObject := SquotShadowMaterializer new
			registry: self objectRegistry;
			rematerializeGraph: anObjectGraph].
	anObject ifNotNil:
		[self haltIf: anObject ~~ materializedObject.
		anObject becomeForward: materializedObject.
		^ anObject].
	^ materializedObject