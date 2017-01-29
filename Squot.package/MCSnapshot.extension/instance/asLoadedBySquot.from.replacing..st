*Squot-loading
asLoadedBySquot: imageStore from: anArtifact replacing: anObject
	"double dispatch"
	^ imageStore loadMonticelloSnapshot: self from: anArtifact replacing: anObject