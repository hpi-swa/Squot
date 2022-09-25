accessing artifacts
putArtifact: anArtifactSnapshot
	| materializedObject |
	artifact := anArtifactSnapshot artifact.
	SquotCurrentMetadata value: anArtifactSnapshot artifact storeInfo during:
		[materializedObject := SquotShadowMaterializer new
			registry: self objectRegistry;
			rematerializeGraph: anArtifactSnapshot objectSnapshot].
	holder contents
		ifNil: [holder contents: materializedObject]
		ifNotNil:
			[self haltIf: holder contents ~~ materializedObject.
			holder contents becomeForward: materializedObject].