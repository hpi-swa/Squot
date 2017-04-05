*Squot-loading
asLoadedBySquot: imageStore from: anArtifact replacing: anObject
	"Answer the object restored from me by imageStore. Double dispatch path"
	^ imageStore loadMetaobject: self from: anArtifact replacing: anObject