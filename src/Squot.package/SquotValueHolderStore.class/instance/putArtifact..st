accessing artifacts
putArtifact: anArtifactSnapshot
	| materializedObject |
	artifact := anArtifactSnapshot artifact.
	SquotCurrentMetadata value: anArtifactSnapshot artifact storeInfo during:
		[materializedObject := SquotShadowMaterializer new
			registry: self objectRegistry;
			rematerializeGraph: anArtifactSnapshot objectSnapshot].
	holder contents: materializedObject.