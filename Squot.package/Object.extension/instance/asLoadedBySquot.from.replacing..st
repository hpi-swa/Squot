*Squot-loading
asLoadedBySquot: imageStore from: anArtifact replacing: anObject
	"double dispatch"
	^ imageStore loadObject: self from: anArtifact replacing: anObject