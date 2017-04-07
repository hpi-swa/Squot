*Squot-loading
squotMaterializeWith: aMaterializer from: anArtifact replacing: anObject
	"Answer the object restored from me by aMaterializer. Double dispatch path"
	^ aMaterializer loadMonticelloSnapshot: self from: anArtifact replacing: anObject