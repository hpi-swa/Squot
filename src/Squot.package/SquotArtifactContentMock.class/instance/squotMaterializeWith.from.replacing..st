loading and unloading
squotMaterializeWith: aMaterializer from: aSquotArtifact replacing: anObject
	^ (materializeBlock ifNil: [self defaultMaterializeBlock]) cull: aMaterializer cull: aSquotArtifact cull: anObject