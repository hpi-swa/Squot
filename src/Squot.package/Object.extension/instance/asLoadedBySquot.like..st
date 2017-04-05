*Squot-loading
asLoadedBySquot: imageStore like: anObject
	"double dispatch"
	^ imageStore loadObject: self like: anObject