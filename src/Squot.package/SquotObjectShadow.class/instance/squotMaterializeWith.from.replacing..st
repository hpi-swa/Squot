rematerializing
squotMaterializeWith: aMaterializer from: anArtifact replacing: anObject
	"Answer the object restored from me by aMaterializer. Double dispatch path"
	self isThisEverCalled.
	^ aMaterializer materializeShadow: self from: anArtifact replacing: anObject