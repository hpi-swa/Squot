private materializing
materializeGraph: anObjectGraph from: anArtifact replacing: anObject
	| materializedObject |
	(self environmentForLoadedArtifact: anArtifact) beCurrentDuring:
	[materializedObject := SquotShadowMaterializer new
		registry: self objectRegistry;
		objectGraph: anObjectGraph;
		rematerialize: anObjectGraph startShadow].
	anObject ifNotNil:
		[self haltIf: anObject ~~ materializedObject.
		anObject becomeForward: materializedObject.
		^ anObject].
	^ materializedObject